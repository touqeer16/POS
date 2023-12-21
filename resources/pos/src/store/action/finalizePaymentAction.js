import apiConfig from "../../config/apiConfig";
import App from '../../App';
import db from '../../indexDb';
import { constants, paymentActionType, ServerActionType, suspendedSalesActionType } from "../../constants";
import moment from "moment";
import { object } from "prop-types";
import prepareSuspendedData from "../../shared/prepareSuspendedData";

export const finalizePayment = (finalize, cb) => async (dispatch) => {
    console.log("finalize", finalize);
    await apiConfig.post('finalize-payment', finalize)
        .then((response) => {
            if (response.data !== null) {
                if (response.data.receipt !== null) {
                    saveFinalizePaymentInIndexedDB(response.data.receipt.print, finalize);
                    dispatch({ type: paymentActionType.PAYMENT_PRINT, payload: response.data.receipt.print, display: true });
                    if (response.data.receipt.print.receipt_printer_type === 'app') {
                        cb({ status: true, receipt: false, data: response.data.receipt });
                    } else {
                        cb({ status: true, receipt: true, data: response.data.receipt.print });
                    }
                    dispatch({ type: constants.ADD_TOAST, payload: { text: response.data.msg, display: true } });


                } else {
                    cb({ status: false, receipt: false });
                    dispatch({
                        type: constants.ADD_TOAST, payload: { text: response.data.msg, display: true }
                    });
                }
            }
        })
        .catch(({ response }) => {
            dispatch({ type: constants.ADD_TOAST, payload: { text: ServerActionType.SERVER_NOT_WORKING, display: true } });
        });
};

export const sendPrintApi = (printUrl, cb) => async (dispatch) => {
    console.log("Here>>", printUrl);
    window.location.href = printUrl;
    await apiConfig.post(printUrl)
        .then((response) => {
            cb({ status: true, data: response });
            console.log("response>>> ", response);

        }).catch(({ }) => {
            cb({ status: false, error: "Error Printing" });

            console.log("Error Printing");
        });
};



export async function saveFinalizePaymentInIndexedDB(data, finalize) {
    if (data) {
        let CurrentUTCTimeStamp = moment(new Date()).format("MMDDYYYYhmms");
        if (db.printData) db.printData.delete(6);
        // if (db.printData) db.printData.clear();
        // db.printData.add({ printDatakey: 'printDatakey', data }).then(() => { });
        db.printData.add(data, 6);

    }
    // console.log(finalize.get('location_id'));
    // console.log(finalize.get('payment[0][amount]'));
    // for (let [key, value] of finalize.entries()) {
    //      console.log(key, value);
    // }

}
export async function APISending(obj) {
    await apiConfig.post('finalize-payment', obj)
        .then(() => {
            console.log(obj);
            console.log('success', "Pendind Data Saved.");

        }).catch(({ }) => {
            console.log('error', "Pendind data not saved.");
        });
}

export async function PrepareAPISending() {
    const all = await db.printPostData.toArray();
    console.log(all);

    const formData = new FormData();
    if (all.length !== 0) {
        all && all.map((obj) => {
            // console.log(obj);
            let Arraykeys = Object.keys(obj);
            for (var key in obj) {
                if (obj.hasOwnProperty(key)) {
                    formData.append(key, obj[key] ? obj[key] : null);
                }
            }
            APISending(formData);

        });
        // console.log(formData);
    }
}

export const SavePendingFinalizePayment = () => async (dispatch) => {
    const all = await db.printPostData.toArray();
    // console.log(all);
    const formData = new FormData();
    if (all.length != 0) {
        all && all.map((obj, key) => {
            console.log(key);
            for (var key in obj) {
                if (obj.hasOwnProperty(key)) {
                    formData.append(key, obj[key]);
                }
            }
            APISending(formData);
        });
        if (db.printPostData) db.printPostData.clear();
    }

};

export const fetchFinalizePaymentFromIndexedDB = (formData, formValues, selectedLocationId, cb) => async (dispatch) => {
    // PrepareAPISending();
    // return;
    const formDataPost = [];
    for (let [key, value] of formData.entries()) {
        formDataPost[key] = value;
    }
    // console.log(formDataPost);
    if (formDataPost !== "") {
        let CurrentUTCTimeStamp = moment(new Date()).format("MMDDYYYYhmms");
        // console.log(CurrentUTCTimeStamp);
        let existingAlready = await db.printPostData.get(CurrentUTCTimeStamp);
        if (existingAlready) {
            if (db.printPostData) db.printPostData.delete(CurrentUTCTimeStamp);
        }
        //if (db.printPostData) db.printPostData.clear();
        db.printPostData.add(formDataPost, CurrentUTCTimeStamp);
    }


    const { cart, paymentCarts } = formValues[0];
    if (db.printData) {
        const printObj = await db.printData.get(6);
        // console.log(printObj);
        // const printData = await db.printData.where('printDatakey').equals('printDatakey').toArray();
        if (printObj) {
            const advance_balance = formData.get("advance_balance");
            const total = formData.get('final_total');
            const change_return = formData.get('change_return');
            const tax_percent = printObj.appliedTax[0].tax_percent;
            let tax_amount = 0;
            const lines = [];
            const modifiers = [];
            let allmodifiertax = 0;
            cart && cart.map((row, index) => {
                // console.log(row);
                // console.log(row.product_row);
                let unit_price = row.product_row.product.unit_price;
                 let unit_price_inc_tax = row.product_row.product.unit_price_inc_tax;
                // console.log(unit_price);
                let singleProductTax = unit_price * tax_percent / 100;
                // console.log(singleProductTax);
                let quantity = row.product_row.quantity;
                let product_name = row.product_row.product.product_name;
                let line_discount = row.product_row.product.line_discount;
                let tax_unformatted = row.product_row.product.tax_unformatted;
                let tax = row.product_row.product.tax;
                // console.log(quantity);
                tax_amount = tax_amount + (quantity * singleProductTax);
                // console.log(tax_amount);
                let sub_total_final = unit_price + singleProductTax;
                // console.log(row.modifiers);
                // lines.push({
                //     ['line_discount']: "0.00",
                //     ['line_total']: unit_price,
                //     ['line_total_uf']: unit_price
                // });
                row.modifiers && row.modifiers.map((modifier) => {
                    if ((modifier.tax_id) && modifier.tax_type == 'inclusive') {
                        let modifiertax = quantity * (modifier.default_sell_price * modifier.tax_dropdown.amount / 100);
                        allmodifiertax = allmodifiertax + modifiertax;
                        // console.log(modifiertax);
                        let default_purchase_price = modifier.default_purchase_price;
                        let line_total = default_purchase_price * quantity;
                        let sell_price_inc_tax = modifier.sell_price_inc_tax;
                        let modifier_tax = 0;
                        if (modifiertax != 0) {
                            modifier_tax = modifier_tax + (modifiertax + (quantity * default_purchase_price));
                        }

                        modifiers.push({
                            ['line_total']: line_total,
                            ['modifier_tax']: modifier_tax,
                            ['name']: product_name,
                            ['price_exc_tax']: (default_purchase_price * quantity),
                            ['quantity']: quantity,
                            ['sell_price_inc_tax']: sell_price_inc_tax,
                            ['single_modifier_tax']: modifiertax,
                            ['sub_total_final']: sell_price_inc_tax,
                            ['tax_amount']: modifier.tax_dropdown.amount,
                            ['tax_id']: modifier.tax_id,
                            ['tax_type']: modifier.tax_type,
                            ['unit_price_exc_tax']: default_purchase_price,
                            ['unit_price_inc_tax']: default_purchase_price,
                            ['units']: "Pc(s)",
                            ['variation']: modifier.name
                        });

                    } else {
                        modifiers.push({
                            ['line_total']: 0.00,
                            ['modifier_tax']: 0,
                            ['name']: product_name,
                            ['price_exc_tax']: 0.00,
                            ['quantity']: quantity,
                            ['sell_price_inc_tax']: 0,
                            ['single_modifier_tax']: 0,
                            ['sub_total_final']: 0.00,
                            ['tax_amount']: 0,
                            ['tax_id']: null,
                            ['tax_type']: null,
                            ['unit_price_exc_tax']: 0,
                            ['unit_price_inc_tax']: 0,
                            ['units']: "Pc(s)",
                            ['variation']: modifier.name
                        });
                    }
                });
                // console.log("row.modifiers.lenght", row.modifiers.length);
                if (row.modifiers.length != 0) {
                    lines.push({
                        ['line_discount']: line_discount,
                        ['line_total']: unit_price,
                        ['modifiers']: modifiers,
                        ['line_total_uf']: unit_price,
                        ['unit_price_inc_tax']: unit_price_inc_tax, 
                        ['name']: product_name,
                        ['price_exc_tax']: unit_price,
                        ['product_variation']: "",
                        ['quantity']: quantity,
                        ['quantity_uf']: quantity,
                        ['single_product_tax']: singleProductTax,
                        ['sub_total_final']: sub_total_final,
                        ['tax']: tax,
                        ['tax_amount']: tax_amount,
                        ['tax_id']: row.product_row.product.tax_id,
                        ['tax_name']: 1,
                        ['tax_percent']: tax_percent,
                        ['tax_unformatted']: tax_unformatted,
                        ['unit_price']: unit_price,
                        ['unit_price_before_discount']: unit_price,
                        ['unit_price_exc_tax']: unit_price,
                        ['unit_price_inc_tax']: unit_price,
                        ['units']: "Pc(s)",
                        ['variation']: quantity,
                    });
                } else {
                    lines.push({
                        ['line_discount']: line_discount,
                        ['line_total']: unit_price,
                        ['line_total_uf']: unit_price,
                        ['unit_price_inc_tax']: unit_price_inc_tax, 
                        ['name']: product_name,
                        ['price_exc_tax']: unit_price,
                        ['product_variation']: "",
                        ['quantity']: quantity,
                        ['quantity_uf']: quantity,
                        ['single_product_tax']: singleProductTax,
                        ['sub_total_final']: sub_total_final,
                        ['tax']: tax,
                        ['tax_amount']: tax_amount,
                        ['tax_id']: row.product_row.product.tax_id,
                        ['tax_name']: 1,
                        ['tax_percent']: tax_percent,
                        ['tax_unformatted']: tax_unformatted,
                        ['unit_price']: unit_price,
                        ['unit_price_before_discount']: unit_price,
                        ['unit_price_exc_tax']: unit_price,
                        ['unit_price_inc_tax']: unit_price,
                        ['units']: "Pc(s)",
                        ['variation']: quantity,
                    });
                }
            });
            // console.log(lines);
            // return;
            // const valuesArray = JSON.parse(lines);
            printObj.lines = lines;
            printObj.modifier_tax = allmodifiertax;
            const totaltax = allmodifiertax + tax_amount;
            const payments = [];
            // console.log(change_return);
            paymentCarts && paymentCarts.map((payment, index) => {
                payments.push({
                    ['amount']: payment.amount + " ﷼",
                    ['date']: moment(new Date()).format("MM/DD/YYYY"),
                    ['method']: payment.payment_type
                });
                if (change_return != 0) {

                    payments.push({
                        ['amount']: (change_return) + " ﷼",
                        ['date']: moment(new Date()).format("MM/DD/YYYY"),
                        ['method']: payment.payment_type + "(Change Return)(-)"
                    });
                }
            });
            printObj.payments = payments;
            printObj.appliedTax[0].tax_amount = tax_amount;
            printObj.tax = tax_amount ? tax_amount + " ﷼" : printObj.tax;
            printObj.call_no = printObj.call_no + 1;
            printObj.invoice_no = (printObj.invoice_no) + 1;
            printObj.invoice_date = moment(new Date()).format("MM/DD/YYYY h:mm");
            printObj.total = total ? total + " ﷼" : printObj.total;
            printObj.tax = totaltax ? totaltax + " ﷼" : printObj.tax;
            printObj.final_total = total ? total : printObj.final_total;
            printObj.total_paid = total ? total + " ﷼" : printObj.total_paid;
            printObj.total_due = advance_balance ? advance_balance + " ﷼" : printObj.total_due;
            db.printData.put(printObj, 6);

            dispatch({ type: paymentActionType.PAYMENT_PRINT, payload: printObj });
            cb({ status: true, receipt: true, data: printObj });
            console.log(printObj);
        }
    }
}

export const updateFinalizePayment = (finalize, transactionId, cb) => async (dispatch) => {
    await apiConfig.post(`update-finalize-payment?transaction_id=${transactionId}`, finalize)
        .then((response) => {
            dispatch({ type: paymentActionType.PAYMENT_PRINT, payload: response.data.receipt.print });
            if (response.data.receipt !== null) {
                dispatch({ type: paymentActionType.PAYMENT_PRINT, payload: response.data.receipt.print });
                cb({ status: true, receipt: true, data: response.data.receipt.print });
                const editSuspendedSale = [];
                dispatch({ type: suspendedSalesActionType.EDIT_SUSPENDED_SALES, payload: editSuspendedSale });

            } else {
                cb({ status: false, receipt: false });
            }
            // App.this.setState(Object.assign({}, { transactionId: '0' }));

        })
        .catch(({ response }) => {
            dispatch({ type: constants.ADD_TOAST, payload: { text: "Failed!", display: true } });
        });
};