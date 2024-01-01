import React, { useEffect, useState, useRef } from "react";
import "bluebird";
import 'cputil';
import '../scss/layout.scss';
import '../scss/style.scss';
import { calculateCartTotalPrice, calculateCartTotalDiscount, calculateCartTotalDiscountType } from "../../shared/CalculateProductPrice";
import { useEventListener, ESCAPE_KEYS } from "../../shared/UseEventListener";
import { connect } from "react-redux";
import { notify } from "../../store/action/notificationAction";
import NumberKeyboard from "./NumberKeyboard";
import { finalizePayment, sendPrintApi, updateFinalizePayment, fetchFinalizePaymentFromIndexedDB, SavePendingFinalizePayment } from "../../store/action/finalizePaymentAction";
import moment from "moment";
import { useReactToPrint } from "react-to-print";
import prepareSuspendedData from "../../shared/prepareSuspendedData";
import { toFixedTrunc } from "../../shared/CalculateProductPrice";
import { QRCodeCanvas } from 'qrcode.react';
import { Buffer } from 'buffer';
import QR from 'qrcode-base64';
import { random } from "lodash";
import { constants } from "../../constants";
import { toast } from 'react-toastify';
import apiConfig from "../../config/apiConfig";
import { array } from "prop-types";





const CASH = 'cash'
const CARD = 'card';
const CLIENT = 'custom_pay_1';
const IPAddress = "192.168.1.7";
export class PrintDataDynamicData extends React.PureComponent {
    render() {
        const print = this.props.paymentPrint;
        const user = this.props.user;
        const locations = this.props.locations;
        const sendPrintApi = this.props.sendPrintApi;
        /*  console.log("print>>>> ", print);
         console.log("user>>>> ", user); */
        generateDynamicHTML(print, user, locations, sendPrintApi);
        /*  multipleKitchenOneReceipt(print, locations); */
        return true;


    }

}

export class PrintData extends React.PureComponent {

    render() {
        const paymentPrint = this.props.paymentPrint;
        const user = this.props.user;
        // console.log(paymentPrint);
        let modifierText = [];
        if (!paymentPrint || paymentPrint.length === 0) {
            return (<div />);
        }
        const countTotalTax = (tax) => {
            let totalAmount = 0;
            tax && tax.appliedTax && tax.appliedTax.forEach(cartItem => {
                totalAmount = totalAmount + cartItem.tax_amount;
            });
            return +totalAmount.toFixed(4);
        }
        const totalProductTax = countTotalTax(paymentPrint);
        const totalModifierTax = paymentPrint.modifier_tax;
        const taxAmount = totalProductTax + totalModifierTax;
        const subTotalRounded = (paymentPrint.final_total -
            parseFloat(taxAmount).toFixed(2));
        let allModifierTax = 0;
        const loadFreeModifiers = (modifiers, notLineatEnd) => {
            let modifierText = [];
            modifiers.forEach((modifier) => {
                if (+modifier.sell_price_inc_tax === 0) {
                    modifierText.push(modifier.variation);
                }
            });

            if (modifierText.length === 0) {
                return '';
            }


            return (
                <tr style={{ "border-bottom": notLineatEnd }} >
                    <td></td>
                    <td style={{ 'fontSize': '14px' }}>{modifierText.join(',')}</td>
                    <td style={{ "textAlign": "end", "padding": "0" }} />
                    <td style={{ 'textAlign': 'end', 'padding': '0', }} />
                    <td style={{ 'textAlign': 'end', 'padding': '0', }} />
                </tr>
            )
        }

        const loadDiscount = (paymentPrint) => {
            if (paymentPrint.discount !== 0) {
                return (
                    <tr>
                        <td style={{ "textAlign": "right", "width": '65%' }}><b style={{ "fontSize": '15px' }}>{paymentPrint.line_discount_label}</b></td>
                        <td style={{ "textAlign": 'end' }}><b>{paymentPrint.discount}</b></td>
                    </tr>
                )
            }
        }
        return (
            <div id="printPDF" style={{ "fontFamily": "'Playfair Display', serif" }}>

                <div style={{ "width": "100%", "padding": "25px" }}>
                    <table class="m-auto" style={{ "width": "auto" }}>
                        <tbody>
                            <tr>
                                {/* <th class="d-none" style={{ "fontWeight": "unset", "width": "50%", "fontSize": '15px' }}>
                                    {moment(new Date()).format("DD/MM/YYYY")}
                                </th>
                                <th class="d-none" style={{ "fontWeight": "unset", "width": "50%", "fontSize": '13px' }}>POS- الك شاورما
                                </th> */}
                                <th class="text-center border-2 border-dark">Call# {paymentPrint.call_no}</th>
                            </tr>
                        </tbody>
                    </table>
                    <table style={{ "width": "100%" }}>
                        <div style={{ "fontWeight": "unset" }}
                            dangerouslySetInnerHTML={{ __html: paymentPrint.header_text }} />
                    </table>
                    <table style={{ "width": "100%" }}>
                        <tbody style={{ "width": "100%" }}>
                            <tr style={{ "width": "100%" }}>
                                <td style={{ 'textAlign': 'center', "width": "100%" }}>
                                    <p style={{ 'margin': '0' }}>
                                        <b style={{
                                            "fontSize": "18px",
                                            "textTransform": "uppercase"
                                        }}>  {paymentPrint.address} / {paymentPrint.display_name} </b>
                                    </p>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    <p style={{ 'textAlign': 'center' }}> Simplified Tax Invoice</p>
                    <hr style={{ "border": "1px solid #000000", "marginBottom": "0", "marginTop": "15px" }} />
                    <table style={{ "width": "100%", "marginBottom": "5px" }}>
                        <tbody style={{ "width": "100%" }}>
                            <tr>
                                <th style={{
                                    "textAlign": "start", "fontWeight": "unset", "width": "100%", "padding": "0",
                                    "fontSize": '15px'
                                }}>
                                    <b>{paymentPrint.invoice_no_prefix}</b>
                                </th>
                                <th></th>
                                <th style={{ "textAlign": "end", "fontWeight": "unset", "padding": "0", "fontSize": '15px' }}>
                                    {paymentPrint.invoice_no}
                                </th>
                            </tr>
                        </tbody>
                    </table>
                    <table style={{ "width": "100%", "marginBottom": "10px" }}>
                        <tbody style={{ "width": "100%" }}>
                            <tr>
                                <th style={{
                                    "textAlign": "start",
                                    "fontWeight": "unset",
                                    "padding": "0",
                                    "fontSize": '15px'
                                }}>
                                    <b>{paymentPrint.date_label}</b></th>
                                <td style={{
                                    "textAlign": "end",
                                    "fontWeight": "unset",
                                    "padding": "0",
                                    "whiteSpace": "nowrap",
                                    "fontSize": '15px'
                                }}>
                                    {paymentPrint.invoice_date}
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    <table style={{ "width": "100%", "marginBottom": "5px" }}>
                        <tbody style={{ "width": "100%" }}>
                            <tr>
                                <th style={{ "borderBottom": " 2.5px dashed #b3b2b2", "paddingLeft": "5px" }}>#</th>
                                <th style={{
                                    "width": "45%",
                                    "padding": "5px",
                                    "borderBottom": "2.5px dashed #b3b2b2",
                                    "fontSize": '15px'
                                }}>{paymentPrint.table_product_label}
                                </th>
                                <th style={{
                                    "textAlign": "center",
                                    "padding": "0",
                                    "borderBottom": "2.5px dashed #b3b2b2",
                                    "fontSize": '15px'
                                }}>{paymentPrint.table_qty_label}
                                </th>
                                <th style={{
                                    "textAlign": "center",
                                    "padding": "0",
                                    "borderBottom": "2.5px dashed #b3b2b2",
                                    "fontSize": '15px'
                                }}>{paymentPrint.table_unit_price_label}
                                </th>
                                <th style={{
                                    "textAlign": "right",
                                    "padding": "0",
                                    "borderBottom": "2.5px dashed #b3b2b2",
                                    "fontSize": '15px'
                                }}>{paymentPrint.table_subtotal_label}
                                </th>
                            </tr>
                            {

                                paymentPrint && paymentPrint.lines.map((line, index, lastindexOfArray) => {
                                    let lineBelow = "none";
                                    let notLineatEnd = "none";
                                    let lastItem = '';
                                    let line_discount = line.line_discount;
                                    const arrayLength = lastindexOfArray.length - 1;
                                    if (line.modifiers && line.modifiers.length !== 0) {
                                        lineBelow = "1px dashed black";
                                        if (index === arrayLength) {
                                            notLineatEnd = "none";
                                            lastItem = true;
                                        } else {
                                            notLineatEnd = "1px solid black";
                                        }
                                    } else {
                                        if (index === 0) {
                                            lineBelow = "1px solid black";
                                        } else if (index === arrayLength) {
                                            lineBelow = "none";
                                            notLineatEnd = "none";
                                        } else {
                                            lineBelow = "1px solid black";
                                        }
                                    }
                                    const unitPriceRounded = toFixedTrunc(line.unit_price, 4);
                                    const roundedValue = +unitPriceRounded + line.single_product_tax;
                                    const subTotalFinal = +roundedValue.toFixed(2) * line.quantity;
                                    return (
                                        <>
                                            <tr style={{ "border-bottom": lineBelow }} key={index}>
                                                <td>{index + 1} </td>
                                                <td>{line.name}</td>
                                                <td style={{
                                                    "textAlign": "center",
                                                    "padding": "0"
                                                }}>{line.quantity}</td>
                                                <td style={{ "textAlign": "center", "padding": "0" }}>
                                                    {roundedValue.toFixed(2)}
                                                </td>
                                                <td style={{ "textAlign": "end", "padding": "0" }}>
                                                    {subTotalFinal.toFixed(2)}
                                                </td>
                                            </tr>
                                            {
                                                line.modifiers && line.modifiers.length !== 0 ?
                                                    line.modifiers.map((modifier, indexLine) => {
                                                        let lineBelowModifier = "none";
                                                        const arrayLengthModifier = line.modifiers.length - 1;
                                                        if ((indexLine === arrayLengthModifier)) {
                                                            lineBelowModifier = "1px dashed black";
                                                        } else {
                                                            lineBelowModifier = "1px dotted black";
                                                        }
                                                        if (+modifier.sell_price_inc_tax === 0) {
                                                            modifierText.push(modifier.variation);
                                                        }
                                                        const modifierPrice = toFixedTrunc(modifier.unit_price_inc_tax, 4);
                                                        let calTax = 0;
                                                        if (modifier.tax_id && modifier.tax_id > 0) {
                                                            calTax = modifierPrice * modifier.tax_amount / 100;
                                                            allModifierTax = allModifierTax + (calTax.toFixed(2) * line.quantity);
                                                        }
                                                        const roundedValue = (+modifierPrice + calTax).toFixed(2);
                                                        if (+modifier.sell_price_inc_tax > 0) {
                                                            return (
                                                                <tr style={{ "border-bottom": lineBelowModifier }} key={indexLine}>
                                                                    <td> </td>
                                                                    <td style={{ 'fontSize': '14px' }}>{modifier.variation}</td>
                                                                    <td style={{
                                                                        "textAlign": "center",
                                                                        "padding": "0",
                                                                        'fontSize': '14px'
                                                                    }}>
                                                                        {modifier.quantity}
                                                                    </td>
                                                                    <td style={{
                                                                        'textAlign': 'center',
                                                                        'padding': '0',
                                                                        'fontSize': '14px'
                                                                    }}>
                                                                        {roundedValue}
                                                                    </td>
                                                                    <td style={{
                                                                        'textAlign': 'end',
                                                                        'padding': '0',
                                                                        'fontSize': '14px'
                                                                    }}>
                                                                        {(roundedValue * modifier.quantity).toFixed(2)}
                                                                    </td>
                                                                </tr>


                                                            )
                                                        }
                                                    }) : null


                                            }
                                            {line.modifiers && line.modifiers.length !== 0 && loadFreeModifiers(line.modifiers, notLineatEnd)}

                                        </>
                                    )
                                })
                            }
                        </tbody>
                    </table>
                    <hr style={{ "border": "1px solid black", "marginTop": "25px" }} />

                    <table style={{ "width": "100%" }}>
                        <tbody style={{ "width": "100%" }}>
                            <tr>
                                <th style={{ 'textAlign': 'right', 'width': '65%', 'fontSize': '15px', 'padding': '0' }}>
                                    {paymentPrint.subtotal_label}
                                </th>
                                <th style={{ 'textAlign': 'end', 'fontSize': '15px', 'padding': '0', }}>
                                    {(paymentPrint.final_total - (allModifierTax + totalProductTax)).toFixed(2) + '﷼ '}
                                </th>
                            </tr>
                            <tr>
                                <td style={{ "textAlign": "right", "width": '65%', "fontSize": '15px' }}>Tax:</td>
                                <td style={{ "textAlign": 'end' }}>(+) ﷼ {(allModifierTax + totalProductTax).toFixed(2)}</td>
                            </tr>
                            <tr>
                                <td style={{ "textAlign": "right", "width": '65%' }}><b
                                    style={{ "fontSize": '15px' }}>{paymentPrint.total_label}</b></td>
                                <td style={{ "textAlign": 'end' }}><b>{paymentPrint.total}</b></td>
                            </tr>

                            {loadDiscount(paymentPrint)}


                            {
                                paymentPrint.payments && paymentPrint.payments.length !== 0 ? paymentPrint.payments.map((payment, index) => {
                                    return (
                                        <tr key={index}>
                                            <td style={{
                                                "textAlign": "right",
                                                "width": '65%',
                                                "fontSize": '13px'
                                            }}>{payment.method}({payment.date})
                                            </td>
                                            <td style={{ "textAlign": 'end', "fontSize": '13px' }}>{payment.amount}</td>
                                        </tr>
                                    )
                                }) : null
                            }
                            <tr>
                                <td style={{
                                    "textAlign": "right",
                                    "width": '65%',
                                    "fontSize": '13px'
                                }}>{paymentPrint.total_paid_label}</td>
                                <td style={{ "textAlign": 'end', "fontSize": '13px' }}>{paymentPrint.total_paid}</td>
                            </tr>
                            <tr>
                                <td style={{
                                    "textAlign": "right",
                                    "width": '65%',
                                    "fontSize": '13px'
                                }}>{paymentPrint.total_due_label}</td>
                                <td style={{ "textAlign": 'end', "fontSize": '13px' }}>{paymentPrint.total_due} </td>
                            </tr>
                        </tbody>
                    </table>
                    {loadQrCode(paymentPrint, allModifierTax, totalProductTax, user)}


                    <table style={{ "width": "100%", "margin-top": "2%" }}>
                        <div style={{
                            "fontWeight": "unset"
                        }} dangerouslySetInnerHTML={{ __html: paymentPrint.footer_text }} />
                    </table>
                    <table style={{ "width": "100%" }}>
                        <tbody style={{ "width": "100%" }}>
                            <tr>
                                <td>
                                    <p style={{
                                        'textAlign': "center",
                                        'margin': "0"
                                    }}>{paymentPrint.additional_notes}</p>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div >
        )
    }

}
const getTLVForvalue = (tagNum, tagValue) => {
    let tagBuf = Buffer.from([tagNum], 'UTF-8');
    let tagValuelenBuf = Buffer.from([tagValue.length], 'UTF-8');
    let tagValueBuf = Buffer.from(tagValue, 'UTF-8');
    let bufsArray = [tagBuf, tagValuelenBuf, tagValueBuf]
    return Buffer.concat(bufsArray);
}

const loadQrCode = (paymentPrint, allModifierTax, totalProductTax, user) => {

    let VATNumber = user.tax_number_1; //"310099050100003";
    let businessName = user.business_name; //"Shawerma Elak";
    let nameArabic = "شاورما الك";


    //console.log("01" + convertToHex(businessName));

    // let sellerNameBufAR = toUTF8Array(nameArabic);
    let sellerNameBufAR = getTLVForvalue("0", nameArabic);
    // console.log(sellerNameBufAR);

    var uint8array = new TextEncoder("utf-8").encode(nameArabic);
    var string = new TextDecoder().decode(uint8array);
    // console.log(uint8array);
    // console.log(string);


    let TotalAmountWithoutCurrency = paymentPrint.total.replace('﷼', '');
    let invoice_date = paymentPrint.invoice_date;
    // let CurrentUTCTimeStamp = moment.utc(new Date()).format();
    let CurrentUTCTimeStamp = moment.utc(invoice_date).format();
    let moditax = (allModifierTax + totalProductTax).toFixed(2);

    // let sellerNameBuf = "01" + convertToHex(businessName);
    // let vatRegistrationNameBuf = "02" + convertToHex(VATNumber);
    // let timeStampBuf = "03" + convertToHex(CurrentUTCTimeStamp);
    // let taxTotalNameBuf = "04" + convertToHex(TotalAmountWithoutCurrency);
    // let vatTotalBuf = "05" + convertToHex(moditax);
    //console.log(sellerNameBuf);
    let sellerNameBuf = getTLVForvalue("01", businessName);
    let vatRegistrationNameBuf = getTLVForvalue("02", VATNumber);
    let timeStampBuf = getTLVForvalue("03", CurrentUTCTimeStamp);
    let taxTotalNameBuf = getTLVForvalue("04", TotalAmountWithoutCurrency);
    let vatTotalBuf = getTLVForvalue("05", moditax);
    let tagsBuffsArray = [sellerNameBuf, vatRegistrationNameBuf, timeStampBuf, taxTotalNameBuf, vatTotalBuf];

    // let tagsBuffsArray = [sellerNameBufAR];
    let qrCodeBuf = Buffer.concat(tagsBuffsArray);
    let qrCodeB64 = qrCodeBuf.toString('base64');


    let generatedBase64String = paymentPrint.generatedBase64String + qrCodeB64;
    //console.log(generatedBase64String);
    //let qrCodeB64 = "AQpTaGF3ZXJtYSBFbGFrAjMxMDA5OTA1MDEwMDAwMwMyMDIyLTA5LTE0VDEyOjUwOjAwWgQgMy4wMAUwLjM5";
    // let qrCodeqrCodeHex = sellerNameBuf + " " + vatRegistrationNameBuf + " " + timeStampBuf + " " + taxTotalNameBuf + " " + vatTotalBuf;
    // let qrCodeB64 = hexToBase64(qrCodeqrCodeHex);
    return (
        <table style={{ "width": "100%", "text-align": "center", "margin-top": "5%" }}>

            <tbody style={{ "width": "100%" }}>
                <tr>
                    <td>
                        <div style={{ "fontWeight": "unset" }}>
                            <QRCodeCanvas id="QRCodeCanvas" value={`${qrCodeB64}`} />
                        </div>

                    </td>
                </tr>
                {/* <tr class="d-none">
                    <td>
                        <div class="d-none">
                            {<p>{user.first_name}</p>}
                            <p>{qrCodeB64} </p>
                            {<p>{qrCodeqrCodeHex}</p>}
                            <p>{TotalAmountWithoutCurrency}</p>
                            <p>{moditax}</p>
                        </div>
                    </td>
                </tr> */}
            </tbody>
        </table>
    )
}



const Payment = (props) => {
    const { carts, notify, finalizePayment, sendPrintApi, updateCart, customer, updateFinalizePayment, fetchFinalizePaymentFromIndexedDB, SavePendingFinalizePayment, transactionId, selectedLocationId, serviceManId, tableId, user, locations } = props;
    const [isPaymentOpenModal, setIsPaymentOpenModal] = useState(false);
    const [finalAmount, setFinalAmount] = useState(0);
    const [selectedInputIndex, setSelectedInputIndex] = useState(0);
    const [cursorPosition, setCursorPosition] = useState(0);
    const [backColor, setBackColor] = useState(false);
    const [printShow, setPrintShow] = useState(false);
    const [clientShow, setClientShow] = useState(false);
    const [paymentPrints, setPaymentPrints] = useState([]);
    const [paymentMethods, setPaymentMethods] = useState([
        {
            amount: +finalAmount,
            payment_type: CASH
        }
    ]);
    const [clientCompany, setClientCompany] = useState(['']);

    const [errorMsg, setErrorMsg] = useState('');
    const componentRef = useRef();
    const [isWifiConnection, setIsWifiConnection] = useState(true);



    useEffect(() => {
        //every second check internet connection
        const interval = setInterval(() => {
            if (navigator.onLine) {
                setIsWifiConnection(true);
                SavePendingFinalizePayment();
            } else {
                setIsWifiConnection(false);
            }
        }, 1000);

        return () => clearInterval(interval);
    }, []);




    // User for Close the model on Escape
    function handler({ key }) {
        if (ESCAPE_KEYS.includes(String(key))) {
            closePaymentModel();
            setPrintShow(false);
        }
    }



    // listen a event of keydown for ESCAPE and close a model
    useEventListener('keydown', handler);
    useEffect(() => {
        // if (isWifiConnection) {
        //     SavePendingFinalizePayment();
        // }
        const finalAmount = calculateCartTotalPrice(carts);
        /* connectPrinter(); */
        setFinalAmount(+finalAmount);
        updateAmount(finalAmount, 0);
        setPaymentMethods([
            {
                amount: +finalAmount,
                payment_type: CASH
            }
        ]);
    }, [carts, isPaymentOpenModal, updateCart, transactionId]);

    useEffect(() => {
        document.body.style.overflow = isPaymentOpenModal ? 'hidden' : 'unset';
    }, [isPaymentOpenModal]);

    // Close a Payment Model
    const closePaymentModel = () => {
        setIsPaymentOpenModal(false);
        setErrorMsg('');
    };

    //Finalize API
    const finalizeData = () => {
        document.getElementById("modal__finalize_btn").disabled = true;
        // draw(); return;
        const formData = [];
        formData.push({
            cart: carts,
            paymentCarts: paymentMethods,
            clientCompany: clientCompany,
            changeReturn: calculateReturnExchange(),
            balance: calculateReturnBalance(),
            discount_amount: calculateCartTotalDiscount(carts),
            discount_type: calculateCartTotalDiscountType(carts),
            finalTotal: finalAmount,
            finalTotalWithoutCurrency: finalAmount,
            suspended: 0,
            customerId: customer ? customer.id : 'no_customer_select',
            transactionId: transactionId ? transactionId : null,
            serviceManId,
            tableId
        });
        if (transactionId) {
            updateFinalizePayment(prepareSuspendedData(formData, selectedLocationId), transactionId, (cb) => {
                if (cb.status) {
                    setIsPaymentOpenModal(false);
                    setPaymentPrints(cb.data);
                    setPrintShow(true);
                    if (cb.receipt) {
                        loadPrintDynamicBlock(cb.data, user, locations, sendPrintApi);
                        /*  printPaymentReceiptPdf(); */
                        updateCart([]);
                    } else {
                        /*  printCustomReceipt(cb.data); */
                        setIsPaymentOpenModal(false);
                    }
                }
            });
        } else {
            if (!isWifiConnection) {
                fetchFinalizePaymentFromIndexedDB(prepareSuspendedData(formData, selectedLocationId), formData, selectedLocationId, (cb) => {
                    if (cb.status) {
                        setIsPaymentOpenModal(false);
                        setPaymentPrints(cb.data);
                        setPrintShow(true);
                        if (cb.receipt) {
                            loadPrintDynamicBlock(cb.data, user, locations, sendPrintApi);
                            /*  printPaymentReceiptPdf(); */
                            updateCart([]);
                        } else {
                            /*  printCustomReceipt(cb.data); */
                            setIsPaymentOpenModal(false);
                        }

                    }
                });
            } else {
                finalizePayment(prepareSuspendedData(formData, selectedLocationId), (cb) => {
                    if (cb.status) {
                        setIsPaymentOpenModal(false);
                        setPaymentPrints(cb.data);
                        setPrintShow(true);
                        if (cb.receipt) {
                            loadPrintDynamicBlock(cb.data, user, locations, sendPrintApi);
                            /*   printPaymentReceiptPdf(); */
                            updateCart([]);
                        } else {
                            /*  printCustomReceipt(cb.data); */
                            setIsPaymentOpenModal(false);
                        }

                    }
                });
            }

        }
        setClientCompany('');
        removePaymentMethod();
    };
    const handleAfterPrint = () => {
        console.log("`onAfterPrint` called");
    };

    const handleBeforePrint = () => {
        console.log("`onBeforePrint` called");
    };
    const handleOnBeforeGetContent = () => {
        console.log("`onBeforeGetContent` called");
    };

    const printPaymentReceiptPdf = () => {
        document.getElementById('printReceipt').click();
    }

    const handlePrint = useReactToPrint({ content: () => componentRef.current });
    // onBeforeGetContent: () => handleOnBeforeGetContent(),
    // onBeforePrint: () => handleBeforePrint(),
    // onAfterPrint: () => handleAfterPrint(),


    // Open a Payment Model
    const openPaymentModel = () => {
        if (carts.length > 0) {
            setIsPaymentOpenModal(true);
        } else {
            notify('Please add at least one product into cart.');
        }
        /* if (finalAmount > 0) {
            setIsPaymentOpenModal(true);
        } else {
            // Display Validation message if cart is empty.
            notify('Please add at least one product into cart.');
        } */
    };

    // Payment method selection
    const selectMethod = (type, index) => {
        console.log(type);
        const methods = paymentMethods.slice();
        methods[index].payment_type = type;
        setPaymentMethods(methods);
        if (type === "custom_pay_1") {
            setClientShow(true);
        } else {
            setClientShow(false);
        }

    }

    const selectClientCompany = (type, index) => {
        setClientCompany(type);
    }


    // Remove payment method
    const removePaymentMethod = (index) => {
        const methods = paymentMethods.slice();
        methods.splice(index, 1);
        setPaymentMethods(methods);
    }

    // Add new Payment Method
    const addNewPaymentMethod = () => {
        setPaymentMethods([
            ...paymentMethods, {
                amount: 0,
                payment_type: CASH
            }
        ]);
    }

    //update amount
    const onChangeAmount = (value, index) => {
        setBackColor(true);
        updateAmount(value, index);
    };

    // Update Active input
    const onFocusSelectInput = (e, index) => {
        setCursorPosition(e.target.selectionStart);
        setSelectedInputIndex(index);
    };

    // Update by Input change
    const updateAmount = (value, index) => {
        const re = /^[0-9.\b]+$/;
        if (value === '' || re.test(value) && paymentMethods.length !== 0) {
            const methods = paymentMethods.slice();
            methods[index].amount = value;
            setPaymentMethods(methods);
        }
    }

    // Update by keyboard
    const updateAmountByKeyboard = (value) => {
        const methods = paymentMethods.slice();
        const amount = methods[selectedInputIndex].amount.toString();
        if (amount.includes(".") && value === '.') {
        } else {
            let finalAmt = 0;
            if (cursorPosition > 0) {
                const firstAmt = amount.substring(0, cursorPosition)
                const lastAmt = amount.substring(cursorPosition);
                finalAmt = firstAmt + value + lastAmt;
            } else {
                finalAmt = amount + value;
            }
            methods[selectedInputIndex].amount = finalAmt;
            setPaymentMethods(methods);
            setBackColor(true);
        }
    }

    // Clear by keyboard
    const clearAmountByKeyboard = () => {
        const methods = paymentMethods.slice();
        const amount = methods[selectedInputIndex].amount.toString();
        let finalAmt = 0;
        if (cursorPosition > 0) {
            let firstAmt = amount.substring(0, cursorPosition)
            const lastAmt = amount.substring(cursorPosition);
            if (firstAmt.length > 0) {
                firstAmt = firstAmt.slice(0, -1)
            }
            finalAmt = firstAmt + lastAmt;
        } else {
            finalAmt = amount.slice(0, -1);
        }
        methods[selectedInputIndex].amount = +finalAmt;
        setPaymentMethods(methods);
        setBackColor(true);
    }

    // Update by keyboard
    const updateBulkCurrentMethodAmount = (value) => {
        setBackColor(true);
        const methods = paymentMethods.slice();
        methods[selectedInputIndex].amount = +methods[selectedInputIndex].amount + (+value);
        setPaymentMethods(methods);
    }

    const calculatePayingAmount = () => {
        let payableAmt = 0;
        paymentMethods.forEach(paymentMethod => {
            payableAmt = payableAmt + (+paymentMethod.amount);
        })

        return +payableAmt.toFixed(2);
    }

    const checkIfitemInCart = () => {
        let payableAmt = 0;
        if (carts.length > 0) {
            payableAmt = 1;
        } else {
            payableAmt = 0;
        }


        /* if (finalAmount > 0) {
            setIsPaymentOpenModal(true);
        } else {
            // Display Validation message if cart is empty.
            notify('Please add at least one product into cart.');
        } */
        return +payableAmt.toFixed(2);
    };

    const calculateReturnExchange = () => {
        const payableAmt = calculatePayingAmount();

        if (finalAmount > payableAmt) {
            return '0.00';
        }

        return +(payableAmt - finalAmount).toFixed(2);
    }

    const calculateReturnBalance = () => {
        const payableAmt = calculatePayingAmount();

        if (finalAmount < payableAmt) {
            return '0.00';
        }

        return +(finalAmount - payableAmt).toFixed(2);
    }

    //Payment Cart Array
    const loadPaymentMethods = (paymentMethod, index) => {
        const finalPayment = paymentMethod.amount ? +paymentMethod.amount : '';
        let custom_contact = '';
        if (locations && locations.business_locations && locations.business_locations.length !== 0) {
            locations.business_locations.map((location) => {
                custom_contact = location.custom_contact;
            });
        } else {
            custom_contact = '';
        }
        let hidecustom_contact = '';
        let custom_field_1 = '';
        let custom_field_2 = '';
        let custom_field_3 = '';
        let custom_field_4 = '';
        let custom_field_5 = '';
        if ((custom_contact.custom_field_1 == null) && (custom_contact.custom_field_2 == null) && (custom_contact.custom_field_3 == null)) {
            hidecustom_contact = 'd-none';
        }
        if (custom_contact.custom_field_1 == null) {
            custom_field_1 = 'd-none';
        }
        if (custom_contact.custom_field_2 == null) {
            custom_field_2 = 'd-none';
        }
        if (custom_contact.custom_field_3 == null) {
            custom_field_3 = 'd-none';
        }
        if (custom_contact.custom_field_4 == null) {
            custom_field_4 = 'd-none';
        }
        if (custom_contact.custom_field_5 == null) {
            custom_field_5 = 'd-none';
        }


        return (
            <div
                className={`${index === 0 ? '' : 'custom-card-space'} pos-modal payment-modal__payment-method bg-secondary p-3`}
                key={index}>
                {paymentMethods.length > 1 ?
                    <div className="callout text-end">
                        <button type="button" className="cross-btn" onClick={() => removePaymentMethod(index)}>X
                        </button>
                    </div>
                    : ''}
                <h6 className="modal-subtitle mb-2"
                    id="paymentModalLabel">
                    Payment Method:
                </h6>

                <div className="modal-btn-grp">
                    <button type="button" onClick={() => selectMethod(CASH, index)}
                        className={`btn modal-btn ${paymentMethod.payment_type === CASH ? 'btn-primary me-2' : 'btn-secondary me-2'}`}>
                        Cash
                    </button>
                    <button type="button" onClick={() => selectMethod(CARD, index)}
                        className={`btn modal-btn ${paymentMethod.payment_type === CARD ? 'btn-primary me-2' : 'btn-secondary me-2'}`}>
                        Card
                    </button>
                    <button type="button" onClick={() => selectMethod(CLIENT, index)}
                        className={`btn modal-btn ${paymentMethod.payment_type === CLIENT ? 'btn-primary me-2' : 'btn-secondary me-2'} ${hidecustom_contact}`}>
                        Client
                    </button>

                </div>
                {clientShow ? <div className={`modal-btn-grp ${hidecustom_contact}`} >
                    <hr style={{ "border": "2px solid #5fc6b0", "marginBottom": "10px", "marginTop": "15px" }} />
                    <h6 className="modal-subtitle mb-2"
                        id="paymentModalLabel">
                        Select Client Company Name:
                    </h6>
                    <hr style={{ "border": "1px dotted #", "marginBottom": "5px", "marginTop": "5px" }} />
                    <button type="button" onClick={() => selectClientCompany(custom_contact.custom_field_1, index)}
                        className={`btn modal-btn ${clientCompany === custom_contact.custom_field_1 ? 'btn-primary me-2' : 'btn-secondary me-2'} ${custom_field_1}`}>
                        {custom_contact.custom_field_1}
                    </button>
                    <button type="button" onClick={() => selectClientCompany(custom_contact.custom_field_2, index)}
                        className={`btn modal-btn ${clientCompany === custom_contact.custom_field_2 ? 'btn-primary me-2' : 'btn-secondary me-2'} ${custom_field_2}`}>
                        {custom_contact.custom_field_2}
                    </button>
                    <button type="button" onClick={() => selectClientCompany(custom_contact.custom_field_3, index)}
                        className={`btn modal-btn ${clientCompany === custom_contact.custom_field_3 ? 'btn-primary me-2' : 'btn-secondary me-2'} ${custom_field_3}`}>
                        {custom_contact.custom_field_3}
                    </button>
                    <button type="button" onClick={() => selectClientCompany(custom_contact.custom_field_4, index)}
                        className={`btn modal-btn ${clientCompany === custom_contact.custom_field_4 ? 'btn-primary me-2' : 'btn-secondary me-2'} ${custom_field_4}`}>
                        {custom_contact.custom_field_4}
                    </button>
                    <button type="button" onClick={() => selectClientCompany(custom_contact.custom_field_5, index)}
                        className={`btn modal-btn ${clientCompany === custom_contact.custom_field_5 ? 'btn-primary me-2' : 'btn-secondary me-2'} ${custom_field_5}`}>
                        {custom_contact.custom_field_5}
                    </button>

                    <hr style={{ "border": "2px solid #5fc6b0", "marginBottom": "10px", "marginTop": "15px" }} />
                </div>
                    : ''}



                <div
                    className="row mt-4 align-items-center">
                    <label htmlFor="amount"
                        className="col-sm-2 col-4 modal-subtitle col-form-label">
                        Amount:
                    </label>
                    <div
                        className="col-sm-10 col-8 field-w-100">
                        <input
                            name="amount"
                            type="number"
                            readOnly={true}
                            className="form-control amount-input read-only-background"
                            onKeyDown={(e) => onFocusSelectInput(e, index)}
                            onClick={(e) => onFocusSelectInput(e, index)}
                            onFocus={(e) => onFocusSelectInput(e, index)}
                            onChange={(e) => onChangeAmount(e.target.value, index)}
                            value={+finalPayment}
                        />
                        <span
                            className="required d-flex justify-content-start text-danger">{errorMsg ? errorMsg : null}</span>
                    </div>
                </div>
            </div>
        )
    };

    const finalPriceStatus = (paymentPrints) => {
        return (
            <div>
                <div className="payment-modal__widgets ps-lg-2 mt-2 pt-1 d-flex flex-wrap">
                    <div
                        className="payment-modal__widgets-block bg-secondary text-center d-flex flex-wrap align-items-center justify-content-center">
                        <div>
                            <span className="payment-modal__items d-block mb-1">
                                Total Items
                            </span>
                            <strong className="payment-modal__total-items d-block">
                                {carts.length}
                            </strong>
                        </div>
                        {/* <div>
                            <span className="payment-modal__items d-block mb-1">
                                Total Paying
                            </span>
                            <strong
                                className="payment-modal__total-items d-block">
                                ﷼
                                {calculatePayingAmount()}
                            </strong>
                        </div> */}
                    </div>
                    <div className={`${backColor && finalAmount === calculatePayingAmount() ? 'bg-div-green' : 'bg-secondary'} payment-modal__widgets-block text-center d-flex flex-wrap align-items-center justify-content-center`}>
                        <div>
                            <span className="payment-modal__items d-block mb-1">
                                Total Payable
                            </span>
                            <strong className="payment-modal__total-items d-block"> ﷼ {finalAmount} </strong>
                            <input type="hidden" id="finalTotalWithoutCurrency" value={`${finalAmount}`} />
                        </div>
                    </div>
                    {/*  <div
                        className={`${backColor && calculateReturnExchange() > 0 ? 'bg-orange' : 'bg-secondary'} payment-modal__widgets-block text-center d-flex flex-wrap align-items-center justify-content-center`}>
                        <div>
                            <span className="payment-modal__items d-block mb-1">
                                Change Return
                            </span>
                            <strong
                                className="payment-modal__total-items d-block">
                                ﷼{calculateReturnExchange()}
                            </strong>
                        </div>
                    </div> */}
                    {/* <div
                        className={`${backColor && calculateReturnBalance() > 0 ? 'bg-danger' : 'bg-secondary'} payment-modal__widgets-block bg-secondary text-center d-flex flex-wrap align-items-center justify-content-center`}>
                        <div>
                            <span className="payment-modal__items d-block mb-1">
                                Balance
                            </span>
                            <strong
                                className="payment-modal__total-items d-block">
                                ﷼{calculateReturnBalance()}
                            </strong>
                        </div>
                    </div> */}
                </div>
                <div className="calculator payment-modal__payment-calculator ms-lg-3 my-4">
                    <div className="row gx-0">
                        <div className="col-12">
                            <NumberKeyboard
                                updateAmount={updateAmountByKeyboard}
                                addAmount={updateBulkCurrentMethodAmount}
                                clearAmount={clearAmountByKeyboard} />
                        </div>
                    </div>
                </div>
                <div className="text-center">
                    {/* <p className="product-checkout__discount mb-0 text-center custom-text">
                        Discount: {calculateCartTotalDiscount(carts)} SR
                    </p>

                    <p className="product-checkout__discount mb-0 text-center custom-text">
                        Discount Type: {calculateCartTotalDiscountType(carts)}
                    </p> */}

                    {/* <button type="button" onClick={() => generateDynamicHTMLDemo()}
                        disabled={calculatePayingAmount() === 0}
                        className="d-none btn btn-primary modal-btn mt-3 mx-lg-3 modal-footer-btn ">
                        Print Dynamic Html
                    </button> */}
                    {/* <canvas id="c"></canvas> */}

                    <div id="qrcode"></div>
                    <button type="button" id="modal__finalize_btn" onClick={() => finalizeData()}
                        disabled={checkIfitemInCart() === 0}
                        className="btn btn-primary modal-btn mt-3 mx-lg-3 modal-footer-btn payment-modal__finalize-btn">
                        Finalize
                    </button>




                </div>
            </div>
        )
    };

    const loadPrintDynamicBlock = (print, user, locations, sendPrintApi) => {
        if (print && print.length !== 0) {
            generateDynamicHTML(print, user, locations, sendPrintApi);
            setClientShow(false);
            setClientCompany('');
            /*  multipleKitchenOneReceipt(print, locations); */
        }
    }

    const displayLabel = () => {
        return (<button type="button"
            className="btn text-primary w-100 h-100 coustom-hover"
            data-bs-toggle="modal"
            data-bs-target="#paymentModal"
            onClick={openPaymentModel}>
            Payment
        </button>)
    }

    if (!isPaymentOpenModal) {
        return displayLabel();
    }
    const loadPrintBlock = () => {
        return (
            <div id="printData" className={'d-none'}>
                <div id="savePrintPDF">
                    {printShow ? <PrintData ref={componentRef} paymentPrint={paymentPrints} user={user} /> : ''}
                </div>
                <button id="printReceipt" onClick={handlePrint}>Print this out!</button>
            </div>
        );
    }



    return (
        <div className="w-100 h-100">
            {displayLabel()}
            <div className="payment-modal pos-modal">
                <div
                    className="modal-dialog modal-dialog-centered hide-show-dialog">
                    <div className="modal-content border-0 px-2 px-sm-4 py-2">
                        <button type="button" className="btn-close"
                            data-bs-dismiss="modal"
                            aria-label="Close"
                            onClick={closePaymentModel}
                            onKeyPress={closePaymentModel}>X
                        </button>
                        {/* <LoadQrCodeTest user={user} /> */}
                        <div className="modal-body">
                            <div className="row">
                                <div
                                    className="col-lg-6 col-12 border-4 border-end border-right-0">
                                    <div
                                        className="pe-lg-2 me-lg-1 mt-4 mt-sm-5 mt-lg-0">
                                        <h5 className="modal-title payment-modal__top-title border-bottom border-4 mb-3 text-start"
                                            id="paymentModalLabel">
                                            Payment
                                        </h5>
                                        <div className="custom-scrollbar">
                                            {paymentMethods.map((paymentMethod, index) => {
                                                return loadPaymentMethods(paymentMethod, index)
                                            })}
                                        </div>
                                    </div>
                                    <button type="button"
                                        className="btn btn-primary modal-btn w-100 mt-3"
                                        onClick={() => addNewPaymentMethod()}>
                                        Add Payment Now
                                    </button>
                                </div>
                                <div className="col-lg-6 col-12">
                                    {finalPriceStatus(paymentPrints)}
                                    {loadPrintBlock()}

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div className="bg-overlay" onClick={closePaymentModel}
                    role="button" tabIndex="0" aria-label="background overlay"
                    onKeyDown={closePaymentModel}>{ }</div>
            </div>
        </div>
    )
}

const printCustomReceipt = (print) => {



    const domElement = document.querySelector('#printPDF');
    /*  console.log("domElement>>>> ", domElement); */
    let dynHtml = "print://escpos.org/escpos/net/print?srcTp=uri&srcObj=html&src='data:text/html,";
    /* dynHtml += encodeURIComponent(`"${print.print_url}"`); */

    dynHtml += encodeURIComponent(`"${domElement}"`);
    /* dynHtml += domElement; */
    dynHtml += "'";
    console.log("dynHtml>>>> ", dynHtml);
    window.location.href = dynHtml;
}

const generateDynamicHTML = (print, user, locations, sendPrintApi) => {
    /*  console.log("locations>>>> ", locations); */
    /* print loop  */
    /*  var element = document.getElementById("savePrintPDF");
     document.getElementById("printData").classList.remove("d-none"); */
    try {
        let number_of_thermal_print_copy = 2;
        if (locations && locations.business_locations && locations.business_locations.length !== 0) {
            locations.business_locations.map((location) => {
                number_of_thermal_print_copy = location.number_of_thermal_print_copy;
            });
        } else {
            number_of_thermal_print_copy = 2;
        }
        if (print && print.length !== 0) {
            const countTotalTax = (tax) => {
                let totalAmount = 0;
                tax && tax.appliedTax && tax.appliedTax.forEach(cartItem => {
                    totalAmount = totalAmount + cartItem.tax_amount;
                });
                return +totalAmount.toFixed(4);
            }
            const totalProductTax = countTotalTax(print);
            let allModifierTax = 0;
            const totalModifierTax = print.modifier_tax;
            const taxAmount = totalProductTax + totalModifierTax;
            const subTotalRounded = (print.final_total - parseFloat(taxAmount).toFixed(2));
            let modifierText = [];
            let dynHtml = "";
            /* Main savePrintPDF div */
            dynHtml += "<div id='savePrintPDF'>";
            /* Main div */
            dynHtml += "<div style=''>";
            /* Second mian div */
            dynHtml += "<div style='width: 100%;padding: 10px;'>";
            /* Header table */
            dynHtml += "<table id='header_text' style='margin: auto;'>";
            dynHtml += "<tbody>";
            dynHtml += "<tr>";
            dynHtml += "<td><div style='font-weight: lighter;font-size: 14px;'>" + print.header_text + "</div></td>";
            dynHtml += "</tr>";
            dynHtml += "<tr>";
            dynHtml += "<td>";
            dynHtml += "<p style='text-align:center;margin: -5px;'>" + print.address + " / " + print.display_name + "</p>";
            dynHtml += "<p style='text-align:center;margin: 0px;font-size: 14px;'> Simplified Tax Invoice</p>";
            dynHtml += "</td>";
            dynHtml += "</tr>";
            dynHtml += "</tbody>";
            dynHtml += "</table>";
            /* header table end */


            /* order number table */
            dynHtml += "<table id='header_call_no' style='margin: auto;'>";
            dynHtml += "<tbody>";
            dynHtml += "<tr>";
            dynHtml += "<th><p style='text-align:center;border: 1px solid;border-color: black;padding: 2px;font-size: 40px;font-weight: lighter; '>Order<img style='width:20px;' src='https://fastich.com/img/hashtag.png' />" + print.call_no + "</p> </th>";
            dynHtml += " </tr>";
            dynHtml += " </tbody>";
            dynHtml += "</table>";

            /*Horizental  Line */
            dynHtml += "<hr style='border: 1px solid black;margin-bottom: 0;margin-top: 5px;' />";
            /* invoice No table */
            dynHtml += "<table id='invoice_no' style='width: 100%;margin-bottom: 0px;'>";
            dynHtml += "<tbody>";
            dynHtml += "<tr>";
            dynHtml += "<th style='width: 100%;text-align: start;padding: 0px;font-size: 15px;'>";
            dynHtml += "<b>" + print.invoice_no_prefix + "</b>";
            dynHtml += "</th>";
            dynHtml += "<td style='width: 100%;font-weight: lighter;text-align: end;padding: 0px;font-size: 15px;'> " + print.invoice_no + "</td>";
            dynHtml += "</tr>";
            dynHtml += " </tbody>";
            dynHtml += "</table>";
            /* Invoice No table  end*/


            /* Date table */
            dynHtml += "<table id='date' style='width: 100%;margin-bottom: 10px;'>";
            dynHtml += "<tbody>";
            dynHtml += "<tr>";
            dynHtml += "<th  style='text-align: start;padding: 0px;font-size: 15px;font-weight: lighter;'>";
            dynHtml += "<b>" + print.date_label + "</b>";
            dynHtml += "</th>";
            dynHtml += "<td style='font-weight: lighter;text-align: end;padding: 0px;font-size: 15px;white-space: nowrap;'>" + print.invoice_date + "</td>";
            dynHtml += "</tr>";
            dynHtml += "</tbody>";
            dynHtml += "</table>";
            /* Date table  end*/


            /* Line Item loop */
            dynHtml += "<table id='line_item' style='width: 100%;margin-bottom: 5px;text-align: center;'>";
            dynHtml += "<tbody>";
            dynHtml += "<tr>";
            /*   dynHtml += "<th style='border-bottom: 2.5px dashed darkgrey;padding-left: 0px;'><img style='width:10px;' src='https://fastich.com/img/hashtag.png' /></th>"; */
            dynHtml += "<th style='border-bottom: 2.5px dashed darkgrey;padding: 0px;font-size: 15px;'>" + print.table_qty_label + "</th>";
            dynHtml += "<th style='border-bottom: 2.5px dashed darkgrey;padding: 5px;font-size: 15px;width:75%;'>" + print.table_product_label + "</th>";
            /* dynHtml += "<th style='border-bottom: 2.5px dashed darkgrey;padding: 0px;font-size: 15px;'>" + print.table_unit_price_label + "</th>"; */
            dynHtml += "<th style='border-bottom: 2.5px dashed darkgrey;padding: 0px;font-size: 15px;'>" + print.table_subtotal_label + "</th>";
            dynHtml += "</tr>";
            /* print lines */
            if (print.lines && print.lines.length !== 0) {
                print && print.lines.map((line, index, lastindexOfArray) => {
                    let lineBelow = "none";
                    let notLineatEnd = "none";
                    let lastItem = '';
                    let line_discount = line.line_discount;
                    const arrayLength = lastindexOfArray.length - 1;
                    if (line.modifiers && line.modifiers.length !== 0) {
                        lineBelow = "none";
                        if (index === arrayLength) {
                            notLineatEnd = "none";
                            lastItem = true;
                        } else {
                            notLineatEnd = "1px solid";
                        }
                    } else {
                        if (index === 0) {
                            lineBelow = "1px solid";
                        } else if (index === arrayLength) {
                            lineBelow = "none";
                            notLineatEnd = "none";
                        } else {
                            lineBelow = "1px solid";
                        }
                    }
                    index = index + 1;
                    const unitPriceRounded = toFixedTrunc(line.sell_price_inc_tax, 4);
                    const roundedValue = +unitPriceRounded + line.single_product_tax;
                    //const subTotalFinal = +roundedValue.toFixed(2) * line.quantity;
                    const subTotalFinal = (line.line_total_uf);
                    dynHtml += "<tr style='font-size: 16px;border-bottom: " + lineBelow + ";' key= '" + index + "'>";
                    /*  dynHtml += "<td style='border-bottom: " + lineBelow + ";'>" + index + "</td>"; */
                    dynHtml += "<td style='text-align: center;font-size: 18px;padding: 0px;border-bottom: " + lineBelow + ";'><b>" + line.quantity + "</b></td>";
                    dynHtml += "<td style='border-bottom: " + lineBelow + ";'>" + line.name + "</td>";
                    /*  dynHtml += "<td style='text-align: center;padding: 0px;border-bottom: " + lineBelow + ";'>" + roundedValue.toFixed(2) + "</td>"; */
                    dynHtml += "<td style='text-align: end;padding: 0px;border-bottom: " + lineBelow + ";'>" + subTotalFinal.toFixed(2) + "</td>";
                    dynHtml += "</tr>";

                    /* line modifiers */
                    if (line.modifiers && line.modifiers.length !== 0) {
                        line.modifiers.map((modifier, indexLine) => {
                            let lineBelowModifier = "none";
                            const arrayLengthModifier = line.modifiers.length - 1;
                            if ((indexLine === arrayLengthModifier)) {
                                lineBelowModifier = "none";
                            } else {
                                lineBelowModifier = "none";
                            }
                            const modifierPrice = toFixedTrunc(modifier.unit_price_inc_tax, 4);
                            let calTax = 0;
                            if (modifier.tax_id && modifier.tax_id > 0) {
                                calTax = modifierPrice * modifier.tax_amount / 100;
                                allModifierTax = allModifierTax + (calTax.toFixed(2) * line.quantity);
                            }
                            const roundedValue = (+modifierPrice + calTax).toFixed(2);
                            if (+modifier.sell_price_inc_tax > 0) {
                                dynHtml += "<tr style='font-size: 14px;border-bottom: " + lineBelowModifier + ";' key= '" + indexLine + "'>";
                                /*  dynHtml += "<td style='border-bottom: " + lineBelowModifier + ";'></td>"; */
                                dynHtml += "<td style='text-align: center;font-size: 18px;padding: 0px;border-bottom: " + lineBelowModifier + ";'><b>" + modifier.quantity + "</b></td>";
                                dynHtml += "<td style='border-bottom: " + lineBelowModifier + ";'>" + modifier.variation + "</td>";
                                /*   dynHtml += "<td style='text-align: center;padding: 0px;border-bottom: " + lineBelowModifier + ";'>" + roundedValue + "</td>"; */
                                dynHtml += "<td style='text-align: end;padding: 0px;border-bottom: " + lineBelowModifier + ";'>" + (roundedValue * modifier.quantity).toFixed(2) + "</td>";
                                dynHtml += "</tr>";
                            }
                        });


                        let modifierText = [];
                        line.modifiers.forEach((modifier) => {
                            if (+modifier.sell_price_inc_tax === 0) {
                                modifierText.push(modifier.variation);
                            }
                        });
                        if (modifierText.length !== 0) {
                            dynHtml += "<tr style='font-size: 14px;border-bottom: " + notLineatEnd + ";'>";
                            /*  dynHtml += "<td style='border-bottom: " + notLineatEnd + ";'></td>"; */
                            dynHtml += "<td style='border-bottom: " + notLineatEnd + ";'></td>";
                            dynHtml += "<td style='border-bottom: " + notLineatEnd + ";'>" + modifierText.join(', ') + "</td>";
                            /*   dynHtml += "<td style='border-bottom: " + notLineatEnd + ";'></td>"; */
                            dynHtml += "<td style='border-bottom: " + notLineatEnd + ";'></td>";
                            dynHtml += "</tr>";
                        }

                    }
                    /* line modifiers end */

                })
            }
            /* print lines end */

            dynHtml += " </tbody>";
            dynHtml += "</table>";
            /* Line Item loop end */


            /* After item line */
            dynHtml += "<hr style='border: 1px solid black;' />";
            /* SubTotal table */
            dynHtml += "<table id='subtotal' style='width: 100%;'>";
            dynHtml += "<tbody>";
            dynHtml += "<tr>";
            dynHtml += "<th style='text-align: right;width: 50%;font-size: 16px;padding: 0px;'>" + print.subtotal_label + "</br>المجموع الفرعي</th>";

            dynHtml += "<td style='text-align: end;font-size: 16px;padding: 0px;width: 50%;'><b>" + (print.final_total - (allModifierTax + totalProductTax)).toFixed(2) + "﷼  </b></td>";
            dynHtml += "</tr>";
            dynHtml += "<tr>";
            dynHtml += "<th style='text-align: right;width: 50%;font-size: 16px;'>" + print.tax_label + "</th>";
            dynHtml += "<td style='text-align: end;width: 50%;font-size: 16px;'> (+) ﷼ " + (allModifierTax + totalProductTax).toFixed(2) + "</td>";
            dynHtml += "</tr>";
            dynHtml += "<tr>";
            dynHtml += "<th style='text-align: right;width: 50%;'>" + print.total_label + "</br> إجمالي</th>";

            dynHtml += "<td style='text-align: end;padding: 0px;font-size: 16px;width: 50%;'><b>" + print.total + "</b></td>";
            dynHtml += "</tr>";

            /* payment Discount */
            if (print.discount && print.discount.lenght !== 0) {
                dynHtml += "<tr>";
                dynHtml += "<th style='text-align: right;width: 50%;font-size: 16px;'>" + print.line_discount_label + "</th>";
                dynHtml += "<td style='text-align: end;font-size: 13px;width: 50%;'><b>" + print.discount + "</b></td>";
                dynHtml += "</tr>";
            }
            /* payment Discount end */

            /* payment prints */
            if (print.payments && print.payments.length !== 0) {
                print.payments.map((payment, index) => {
                    dynHtml += "<tr key= '" + index + "'>";
                    dynHtml += "<th style='text-align: right;font-size: 16px;width: 50%;'>" + payment.method + ":</th>";
                    dynHtml += "<td style='text-align: end;font-size: 16px;width: 50%;'>" + payment.amount + "</td>";
                    dynHtml += "</tr>";

                    if (print.clientCompany != '') {
                        dynHtml += "<tr>";
                        dynHtml += "<th style='text-align: right;font-size: 16px;width: 50%;'>" + print.clientCompanyLabel + ":</th>";
                        dynHtml += "<td style='text-align: end;font-size: 16px;width: 50%;'>" + print.clientCompany + "</td>";
                        dynHtml += "</tr>";
                    }
                })
            }


            /* payment prints Ends */

            /* Total Paid */
            /* dynHtml += "<tr>";
            dynHtml += "<th style='text-align: right;width: 50%;font-size: 16px;'>" + print.total_paid_label + "</th>";
            dynHtml += "<td style='text-align: end;font-size: 16px;width: 50%;'>" + print.total_paid + "</td>";
            dynHtml += "</tr>"; */

            /* Toyal Due */
            /*  dynHtml += "<tr>";
             dynHtml += "<th style='text-align: right;width: 50%;font-size: 13px;'>" + print.total_due_label + "</th>";
             dynHtml += "<td style='text-align: end;font-size: 16px;width: 50%;'>" + print.total_due + "</td>";
             dynHtml += "</tr>"; */

            dynHtml += "</tbody>";
            dynHtml += "</table>";
            /* SubTotal end  end*/
            /*Horizental  Line */
            dynHtml += "<hr style='border: 1px solid black;margin-bottom: 0;' />";
            dynHtml += "<p style='text-align: center;margin:0;'>Products Count " + print.lines.length + "</p>";
            dynHtml += "<hr style='border: 1px solid black;margin-bottom: 3px;margin-top: 5px;' />";


            /* Footer table */
            dynHtml += "<table id='footer' style='width: 100%;margin-top: 0px;'>";
            dynHtml += "<tbody style='width: 100%;'>";
            dynHtml += "<tr>";
            dynHtml += "<td>" + print.footer_text + "</td>";
            dynHtml += "</tr>";
            dynHtml += "</tbody>";
            dynHtml += "</table>";
            /* Footer table  end*/

            /* Addtional Notes table */
            dynHtml += "<table id='additional_notes' style='width: 100%;display:none;'>";
            dynHtml += "<tbody style='width: 100%;'>";
            dynHtml += "<tr>";
            dynHtml += "<td>";
            dynHtml += "<p style='text-align: center;margin:0;'>" + print.additional_notes + "</p>";
            dynHtml += "</td>";
            dynHtml += "</tr>";
            dynHtml += "</tbody>";
            dynHtml += "</table>";
            /* Addtional Notes  end*/

            /*  var imgData = QR.drawImg(qrCodeB64, {
               typeNumber: 4,
               errorCorrectLevel: 'M',
               size: 200
           }); */


            /* QR Code Function */
            let VATNumber = user.tax_number_1; //"310099050100003";
            let businessName = user.business_name; //"Shawerma Elak";
            let TotalAmountWithoutCurrency = print.total.replace('﷼', '');
            let invoice_date = print.invoice_date;
            // let CurrentUTCTimeStamp = moment.utc(new Date()).format();
            let CurrentUTCTimeStamp = moment.utc(invoice_date).format();
            let moditax = (allModifierTax + totalProductTax).toFixed(2);

            let sellerNameBuf = getTLVForvalue("01", businessName);
            let vatRegistrationNameBuf = getTLVForvalue("02", VATNumber);
            let timeStampBuf = getTLVForvalue("03", CurrentUTCTimeStamp);
            let taxTotalNameBuf = getTLVForvalue("04", TotalAmountWithoutCurrency);
            let vatTotalBuf = getTLVForvalue("05", moditax);
            let tagsBuffsArray = [sellerNameBuf, vatRegistrationNameBuf, timeStampBuf, taxTotalNameBuf, vatTotalBuf];
            let qrCodeBuf = Buffer.concat(tagsBuffsArray);
            let qrCodeB64 = qrCodeBuf.toString('base64');
            /*    console.log("qrCodeB64>>>", qrCodeB64); */
            var imgData = QR.drawImg(qrCodeB64, {
                typeNumber: 1,
                size: 200
            });
            /* console.log("imgData>>>", imgData); */

            /* QR Code table */
            dynHtml += "<table id='qr_code' style='width: 100%;text-align:center;margin-top:10px;'>";
            dynHtml += "<tbody style='width: 100%;'>";
            dynHtml += "<tr>";
            dynHtml += "<td>";
            dynHtml += "<img style='width:150px' src='" + imgData + "' />";
            dynHtml += "</td>";
            dynHtml += "</tr>";
            dynHtml += "</tbody>";
            dynHtml += "</table>";
            /* QR Code table  end*/

            /* second div end */
            dynHtml += "</div>";
            /* main div end */
            dynHtml += "</div>";
            dynHtml += "</div>";
            let printUrl = "print://escpos.org/escpos/net/print?srcTp=uri&srcObj=html&numCopies=" + number_of_thermal_print_copy + "&src='data:text/html,";
            printUrl += encodeURIComponent(dynHtml);
            printUrl += "'";
            console.log("dynHtml>>>> ", dynHtml);
            window.location.href = printUrl;
            /* return true; */
            /*  sendPrintApi(printUrl, (cb) => {
                 console.log("cb>>>> ", cb);
                 if (cb.status) {
                     toast.success('Receipt Printed !', { position: toast.POSITION.TOP_RIGHT });
                     toast.success(cb.data, { position: toast.POSITION.TOP_RIGHT });
                 } else {
                     toast.error(cb.error, { position: toast.POSITION.TOP_RIGHT });
                 }
             }); */
            /*   toast.success('Receipt Printed !', { position: toast.POSITION.TOP_RIGHT }); */
        }
    } catch (e) {
        toast.error('Error in Printing !', { position: toast.POSITION.TOP_RIGHT });
        console.log('Error Printing....');
    }

    /* setTimeout(function () {
        console.log("Hello World");

    }, 2000); */

    return;
}


const multipleKitchen = (print, kitchenLines, locations, kitchenNumber) => {
    console.log("Here in Kitchen print>>>> ");
    try {
        if ((print && print.length !== 0) && (kitchenLines && kitchenLines.length !== 0)) {

            let number_of_thermal_print_copy = 2;
            if (locations && locations.business_locations && locations.business_locations.length !== 0) {
                locations.business_locations.map((location) => {
                    number_of_thermal_print_copy = location.number_of_thermal_print_copy;
                });
            } else {
                number_of_thermal_print_copy = 2;
            }
            const countTotalTax = (tax) => {
                let totalAmount = 0;
                tax && tax.appliedTax && tax.appliedTax.forEach(cartItem => {
                    totalAmount = totalAmount + cartItem.tax_amount;
                });
                return +totalAmount.toFixed(4);
            }
            const totalProductTax = countTotalTax(print);
            let allModifierTax = 0;
            const totalModifierTax = print.modifier_tax;
            const taxAmount = totalProductTax + totalModifierTax;
            const subTotalRounded = (print.final_total - parseFloat(taxAmount).toFixed(2));
            let modifierText = [];
            let dynHtml = "";
            /* Main savePrintPDF div */
            dynHtml += "<div id='savePrintPDF'>";
            /* Main div */
            dynHtml += "<div style=''>";
            /* Second mian div */
            dynHtml += "<div style='width: 100%;padding: 10px;'>";



            /* order number table */
            dynHtml += "<table id='header_call_no' style='margin: auto;'>";
            dynHtml += "<tbody>";
            dynHtml += "<tr>";
            dynHtml += "<th><p style='text-align:center;border: 1px solid;border-color: black;padding: 2px;font-size: 40px;font-weight: lighter; '>Kitchen<img style='width:20px;' src='https://fastich.com/img/hashtag.png' />" + kitchenNumber + "</p></th>";
            dynHtml += " </tr>";
            dynHtml += "<tr>";
            dynHtml += "<th><p style='text-align:center;border: 1px solid;border-color: black;padding: 2px;font-size: 40px;font-weight: lighter; '>Order<img style='width:20px;' src='https://fastich.com/img/hashtag.png' />" + print.call_no + "</p></th>";
            dynHtml += " </tr>";
            dynHtml += " </tbody>";
            dynHtml += "</table>";


            /* Line Item loop */
            dynHtml += "<table id='line_item' style='width: 100%;margin-bottom: 5px;text-align: center;'>";
            dynHtml += "<tbody>";
            dynHtml += "<tr>";
            /*dynHtml += "<th style='border-bottom: 2.5px dashed darkgrey;padding-left: 0px;'><img style='width:10px;' src='https://fastich.com/img/hashtag.png' /></th>"; */
            dynHtml += "<th style='border-bottom: 2.5px dashed darkgrey;padding: 0px;font-size: 15px;'>" + print.table_qty_label + "</th>";
            dynHtml += "<th style='border-bottom: 2.5px dashed darkgrey;padding: 5px;font-size: 15px;width:75%;'>" + print.table_product_label + "</th>";
            /* dynHtml += "<th style='border-bottom: 2.5px dashed darkgrey;padding: 0px;font-size: 15px;'>" + print.table_unit_price_label + "</th>"; */
            dynHtml += "<th style='border-bottom: 2.5px dashed darkgrey;padding: 0px;font-size: 15px;'>" + print.table_subtotal_label + "</th>";
            dynHtml += "</tr>";

            /* print lines */
            if (kitchenLines && kitchenLines.length !== 0) {
                kitchenLines && kitchenLines.map((line, index, lastindexOfArray) => {
                    let CatID = line.catID;
                    let lineBelow = "none";
                    let notLineatEnd = "none";
                    let lastItem = '';
                    let line_discount = line.line_discount;
                    const arrayLength = lastindexOfArray.length - 1;
                    if (line.modifiers && line.modifiers.length !== 0) {
                        lineBelow = "none";
                        if (index === arrayLength) {
                            notLineatEnd = "none";
                            lastItem = true;
                        } else {
                            notLineatEnd = "1px solid";
                        }
                    } else {
                        if (index === 0) {
                            lineBelow = "1px solid";
                        } else if (index === arrayLength) {
                            lineBelow = "none";
                            notLineatEnd = "none";
                        } else {
                            lineBelow = "1px solid";
                        }
                    }


                    index = index + 1;
                    const unitPriceRounded = toFixedTrunc(line.sell_price_inc_tax, 4);
                    const roundedValue = +unitPriceRounded + line.single_product_tax;
                    //const subTotalFinal = +roundedValue.toFixed(2) * line.quantity;
                    const subTotalFinal = (line.line_total_uf);
                    dynHtml += "<tr style='font-size: 16px;border-bottom: " + lineBelow + ";' key= '" + index + "'>";
                    /*  dynHtml += "<td style='border-bottom: " + lineBelow + ";'>" + index + "</td>"; */
                    dynHtml += "<td style='text-align: center;font-size: 18px;padding: 0px;border-bottom: " + lineBelow + ";'><b>" + line.quantity + "</b></td>";
                    dynHtml += "<td style='border-bottom: " + lineBelow + ";'>" + line.name + "</td>";
                    /*  dynHtml += "<td style='text-align: center;padding: 0px;border-bottom: " + lineBelow + ";'>" + roundedValue.toFixed(2) + "</td>"; */
                    dynHtml += "<td style='text-align: end;padding: 0px;border-bottom: " + lineBelow + ";'>" + subTotalFinal.toFixed(2) + "</td>";
                    dynHtml += "</tr>";

                    /* line modifiers */
                    if (line.modifiers && line.modifiers.length !== 0) {
                        line.modifiers.map((modifier, indexLine) => {
                            let lineBelowModifier = "none";
                            const arrayLengthModifier = line.modifiers.length - 1;
                            if ((indexLine === arrayLengthModifier)) {
                                lineBelowModifier = "none";
                            } else {
                                lineBelowModifier = "none";
                            }
                            const modifierPrice = toFixedTrunc(modifier.unit_price_inc_tax, 4);
                            let calTax = 0;
                            if (modifier.tax_id && modifier.tax_id > 0) {
                                calTax = modifierPrice * modifier.tax_amount / 100;
                                allModifierTax = allModifierTax + (calTax.toFixed(2) * line.quantity);
                            }
                            const roundedValue = (+modifierPrice + calTax).toFixed(2);
                            if (+modifier.sell_price_inc_tax > 0) {
                                dynHtml += "<tr style='font-size: 14px;border-bottom: " + lineBelowModifier + ";' key= '" + indexLine + "'>";
                                /*  dynHtml += "<td style='border-bottom: " + lineBelowModifier + ";'></td>"; */
                                dynHtml += "<td style='text-align: center;font-size: 18px;padding: 0px;border-bottom: " + lineBelowModifier + ";'><b>" + modifier.quantity + "</b></td>";
                                dynHtml += "<td style='border-bottom: " + lineBelowModifier + ";'>" + modifier.variation + "</td>";
                                /*   dynHtml += "<td style='text-align: center;padding: 0px;border-bottom: " + lineBelowModifier + ";'>" + roundedValue + "</td>"; */
                                dynHtml += "<td style='text-align: end;padding: 0px;border-bottom: " + lineBelowModifier + ";'>" + (roundedValue * modifier.quantity).toFixed(2) + "</td>";
                                dynHtml += "</tr>";
                            }
                        });


                        let modifierText = [];
                        line.modifiers.forEach((modifier) => {
                            if (+modifier.sell_price_inc_tax === 0) {
                                modifierText.push(modifier.variation);
                            }
                        });
                        if (modifierText.length !== 0) {
                            dynHtml += "<tr style='font-size: 14px;border-bottom: " + notLineatEnd + ";'>";
                            /*  dynHtml += "<td style='border-bottom: " + notLineatEnd + ";'></td>"; */
                            dynHtml += "<td style='border-bottom: " + notLineatEnd + ";'></td>";
                            dynHtml += "<td style='border-bottom: " + notLineatEnd + ";'>" + modifierText.join(', ') + "</td>";
                            /*   dynHtml += "<td style='border-bottom: " + notLineatEnd + ";'></td>"; */
                            dynHtml += "<td style='border-bottom: " + notLineatEnd + ";'></td>";
                            dynHtml += "</tr>";
                        }

                    }
                    /* line modifiers end */


                })
            }
            /* print lines end */

            dynHtml += " </tbody>";
            dynHtml += "</table>";
            /* Line Item loop end */

            /* second div end */
            dynHtml += "</div>";
            /* main div end */
            dynHtml += "</div>";
            dynHtml += "</div>";
            let printUrl = "print://escpos.org/escpos/net/print?srcTp=uri&srcObj=html&numCopies=" + number_of_thermal_print_copy + "&src='data:text/html,";
            printUrl += encodeURIComponent(dynHtml);
            printUrl += "'";
            setTimeout(function () {
            }, 10000);
            window.location.href = printUrl;
            console.log("kitchenNumber : " + kitchenNumber + "  >>>>", dynHtml);

        }
    } catch (e) {
        toast.error('Error in printing kitchen copy !', { position: toast.POSITION.TOP_RIGHT });
        console.log('Error in printing kitchen copy....');
    }
    return;

}


const multipleKitchenOneReceipt = (print, locations) => {
    let kitchenExist = print.kitchenExist;
    if ((kitchenExist)) {
        let dynHtml = "";
        let kitchenNumber = '';
        let number_of_thermal_print_copy = 2;
        if (print.kitchens && print.kitchens.length !== 0) {
            print && print.kitchens.map((kitchen, index, lastindexOfArray) => {
                let kitchenLines = [];
                kitchenNumber = kitchen.kitchenNumber;
                let kitchenCatID = '';
                let $i = 0;
                if (kitchen.kitchenCategory && kitchen.kitchenCategory.length !== 0) {
                    kitchen.kitchenCategory.map((kitchenCat, indexLine) => {
                        kitchenCatID = kitchenCat.kitchenCatID;
                        if (print.lines && print.lines.length !== 0) {
                            print && print.lines.map((line, index, lastindexOfArray) => {
                                if (kitchenCatID == line.catID) {
                                    console.log("kitchenCatID >>>> ", kitchenCatID);
                                    kitchenLines[$i] = line;
                                    console.log("kitchenLines >>>> ", kitchenLines);
                                    $i = $i + 1;
                                }
                            })
                        }
                    });
                }
                console.log("kitchenNumber >>>> ", kitchenNumber);
                if ((kitchenLines && kitchenLines.length !== 0)) {
                    try {
                        if ((print && print.length !== 0) && (kitchenLines && kitchenLines.length !== 0)) {
                            if (locations && locations.business_locations && locations.business_locations.length !== 0) {
                                locations.business_locations.map((location) => {
                                    number_of_thermal_print_copy = location.number_of_thermal_print_copy;
                                });
                            } else {
                                number_of_thermal_print_copy = 2;
                            }
                            const countTotalTax = (tax) => {
                                let totalAmount = 0;
                                tax && tax.appliedTax && tax.appliedTax.forEach(cartItem => {
                                    totalAmount = totalAmount + cartItem.tax_amount;
                                });
                                return +totalAmount.toFixed(4);
                            }
                            const totalProductTax = countTotalTax(print);
                            let allModifierTax = 0;
                            const totalModifierTax = print.modifier_tax;
                            const taxAmount = totalProductTax + totalModifierTax;
                            const subTotalRounded = (print.final_total - parseFloat(taxAmount).toFixed(2));
                            let modifierText = [];
                            /* Main savePrintPDF div */
                            dynHtml += "<div id='savePrintPDF'>";
                            /* Main div */
                            dynHtml += "<div style=''>";
                            /* Second mian div */
                            dynHtml += "<div style='width: 100%;padding: 10px;'>";
                            /* order number table */
                            dynHtml += "<table id='header_call_no' style='margin: auto;'>";
                            dynHtml += "<tbody>";
                            dynHtml += "<tr>";
                            dynHtml += "<th><p style='text-align:center;border: 1px solid;border-color: black;padding: 2px;font-size: 40px;font-weight: lighter; '>" + kitchenNumber + "</p></th>";
                            dynHtml += " </tr>";
                            dynHtml += "<tr>";
                            dynHtml += "<th><p style='text-align:center;border: 1px solid;border-color: black;padding: 2px;font-size: 40px;font-weight: lighter; '>Order<img style='width:20px;' src='https://fastich.com/img/hashtag.png' />" + print.call_no + "</p></th>";
                            dynHtml += " </tr>";
                            dynHtml += " </tbody>";
                            dynHtml += "</table>";
                            /* Line Item loop */
                            dynHtml += "<table id='line_item' style='width: 100%;margin-bottom: 5px;text-align: center;'>";
                            dynHtml += "<tbody>";
                            dynHtml += "<tr>";
                            /*dynHtml += "<th style='border-bottom: 2.5px dashed darkgrey;padding-left: 0px;'><img style='width:10px;' src='https://fastich.com/img/hashtag.png' /></th>"; */
                            dynHtml += "<th style='border-bottom: 2.5px dashed darkgrey;padding: 0px;font-size: 15px;'>" + print.table_qty_label + "</th>";
                            dynHtml += "<th style='border-bottom: 2.5px dashed darkgrey;padding: 5px;font-size: 15px;width:75%;'>" + print.table_product_label + "</th>";
                            /* dynHtml += "<th style='border-bottom: 2.5px dashed darkgrey;padding: 0px;font-size: 15px;'>" + print.table_unit_price_label + "</th>"; */
                            dynHtml += "<th style='border-bottom: 2.5px dashed darkgrey;padding: 0px;font-size: 15px;'>" + print.table_subtotal_label + "</th>";
                            dynHtml += "</tr>";
                            /* print lines */
                            if (kitchenLines && kitchenLines.length !== 0) {
                                kitchenLines && kitchenLines.map((line, index, lastindexOfArray) => {
                                    let CatID = line.catID;
                                    let lineBelow = "none";
                                    let notLineatEnd = "none";
                                    let lastItem = '';
                                    let line_discount = line.line_discount;
                                    const arrayLength = lastindexOfArray.length - 1;
                                    if (line.modifiers && line.modifiers.length !== 0) {
                                        lineBelow = "none";
                                        if (index === arrayLength) {
                                            notLineatEnd = "none";
                                            lastItem = true;
                                        } else {
                                            notLineatEnd = "1px solid";
                                        }
                                    } else {
                                        if (index === 0) {
                                            lineBelow = "1px solid";
                                        } else if (index === arrayLength) {
                                            lineBelow = "none";
                                            notLineatEnd = "none";
                                        } else {
                                            lineBelow = "1px solid";
                                        }
                                    }
                                    index = index + 1;
                                    const unitPriceRounded = toFixedTrunc(line.sell_price_inc_tax, 4);
                                    const roundedValue = +unitPriceRounded + line.single_product_tax;
                                    //const subTotalFinal = +roundedValue.toFixed(2) * line.quantity;
                                    const subTotalFinal = (line.line_total_uf);
                                    dynHtml += "<tr style='font-size: 16px;border-bottom: " + lineBelow + ";' key= '" + index + "'>";
                                    /*  dynHtml += "<td style='border-bottom: " + lineBelow + ";'>" + index + "</td>"; */
                                    dynHtml += "<td style='text-align: center;font-size: 18px;padding: 0px;border-bottom: " + lineBelow + ";'><b>" + line.quantity + "</b></td>";
                                    dynHtml += "<td style='border-bottom: " + lineBelow + ";'>" + line.name + "</td>";
                                    /*  dynHtml += "<td style='text-align: center;padding: 0px;border-bottom: " + lineBelow + ";'>" + roundedValue.toFixed(2) + "</td>"; */
                                    dynHtml += "<td style='text-align: end;padding: 0px;border-bottom: " + lineBelow + ";'>" + subTotalFinal.toFixed(2) + "</td>";
                                    dynHtml += "</tr>";

                                    /* line modifiers */
                                    if (line.modifiers && line.modifiers.length !== 0) {
                                        line.modifiers.map((modifier, indexLine) => {
                                            let lineBelowModifier = "none";
                                            const arrayLengthModifier = line.modifiers.length - 1;
                                            if ((indexLine === arrayLengthModifier)) {
                                                lineBelowModifier = "none";
                                            } else {
                                                lineBelowModifier = "none";
                                            }
                                            const modifierPrice = toFixedTrunc(modifier.unit_price_inc_tax, 4);
                                            let calTax = 0;
                                            if (modifier.tax_id && modifier.tax_id > 0) {
                                                calTax = modifierPrice * modifier.tax_amount / 100;
                                                allModifierTax = allModifierTax + (calTax.toFixed(2) * line.quantity);
                                            }
                                            const roundedValue = (+modifierPrice + calTax).toFixed(2);
                                            if (+modifier.sell_price_inc_tax > 0) {
                                                dynHtml += "<tr style='font-size: 14px;border-bottom: " + lineBelowModifier + ";' key= '" + indexLine + "'>";
                                                /*  dynHtml += "<td style='border-bottom: " + lineBelowModifier + ";'></td>"; */
                                                dynHtml += "<td style='text-align: center;font-size: 18px;padding: 0px;border-bottom: " + lineBelowModifier + ";'><b>" + modifier.quantity + "</b></td>";
                                                dynHtml += "<td style='border-bottom: " + lineBelowModifier + ";'>" + modifier.variation + "</td>";
                                                /*   dynHtml += "<td style='text-align: center;padding: 0px;border-bottom: " + lineBelowModifier + ";'>" + roundedValue + "</td>"; */
                                                dynHtml += "<td style='text-align: end;padding: 0px;border-bottom: " + lineBelowModifier + ";'>" + (roundedValue * modifier.quantity).toFixed(2) + "</td>";
                                                dynHtml += "</tr>";
                                            }
                                        });
                                        let modifierText = [];
                                        line.modifiers.forEach((modifier) => {
                                            if (+modifier.sell_price_inc_tax === 0) {
                                                modifierText.push(modifier.variation);
                                            }
                                        });
                                        if (modifierText.length !== 0) {
                                            dynHtml += "<tr style='font-size: 14px;border-bottom: " + notLineatEnd + ";'>";
                                            /*  dynHtml += "<td style='border-bottom: " + notLineatEnd + ";'></td>"; */
                                            dynHtml += "<td style='border-bottom: " + notLineatEnd + ";'></td>";
                                            dynHtml += "<td style='border-bottom: " + notLineatEnd + ";'>" + modifierText.join(', ') + "</td>";
                                            /*   dynHtml += "<td style='border-bottom: " + notLineatEnd + ";'></td>"; */
                                            dynHtml += "<td style='border-bottom: " + notLineatEnd + ";'></td>";
                                            dynHtml += "</tr>";
                                        }
                                    }
                                    /* line modifiers end */
                                })
                            }
                            /* print lines end */

                            dynHtml += " </tbody>";
                            dynHtml += "</table>";
                            /* Line Item loop end */

                            /* second div end */
                            dynHtml += "</div>";
                            /* main div end */
                            dynHtml += "</div>";
                            dynHtml += "</div>";
                            /*Horizental  Line */
                            dynHtml += "<hr style='border: 1px solid black;margin-bottom: 15;margin-top: 15px;' />";
                        }
                    } catch (e) {
                        toast.error('Error in printing kitchen copy !', { position: toast.POSITION.TOP_RIGHT });
                        console.log('Error in printing kitchen copy....');
                    }
                }
            });
        }
        setTimeout(function () {
            let printUrl = "print://escpos.org/escpos/net/print?srcTp=uri&srcObj=html&numCopies=" + number_of_thermal_print_copy + "&src='data:text/html,";
            printUrl += encodeURIComponent(dynHtml);
            printUrl += "'";
            window.location.href = printUrl;
            console.log("kitchenNumber : " + kitchenNumber + "  >>>>", dynHtml);
        }, 5000);

    }

    return;

}
function downloadBase64File(base64Data, contentType, fileName) {
    const linkSource = base64Data;
    const downloadLink = document.createElement("a");
    downloadLink.href = linkSource;
    downloadLink.download = fileName;
    downloadLink.click();
}

function Base64ToImage(base64img) {


    var img = new Image();
    img.onload = function () {
        return img;
    };
    img.src = base64img;
    return img;
}


function draw() {
    var ctx = document.querySelector('#canvas1').getContext('2d');
    var img1 = new Image();
    img1.onload = function () {
        ctx.drawImage(img1, 40, 10);
    }
    let src = 'R0lGODdhyADIAIAAAAAAAP///ywAAAAAyADIAAAC/4yPqcvtD6OctNqLs968+w+G4kiW5omm6sq27gvH8kzX9o3n+s73/g8MCofEovGITCqXzKbzCY1Kp9Sq9YqlAbbcrvcLRnQZYACZK0YvypTxgf1WK8r0uvlkz3vT2/PXf2fgNhc2MRgAJyiXoNcYWOKox/c4eTh5uVYocZiIuFgZqQkZWodJ+JfZF6d6ume42Gm5SipKIrsJm0sKyKlLZ8pYm0r5yjpq3OYL2sirPBv7+RzdinEbYg3Ra0xLrIjq/ZgHvNwdjFxcDoL9oB1O27ztC30Ovg5ePX0tL2otjg7cLhJAYfekffNET1+8UrPgucK10F1EgQ0NlgvIL5+6ff8H+9lJFnHgror18mHsqPHDyYcIL378R7IlOX8FSyZc2Q4FTmc1W86TCNSeuaApbQKdyfMYUZQhLeaM2Skbx3QWRf6KaWvq0540ZUIl2GClVKZLWQrlsLMp15drJxYdSm6sWa1Js7olC3LuXaqtog4DBNhp3RFpj6Lb6vMt0oTjsH5l2NNuWcRyEft10DUwtb+C1SpdbBii3rJ5L8PlvNkoZcKKUZ/uC9ayydZtR+NjrJL2692gNXuN7Bjz1Maideom/nuoadk3dYsNHuHsBumpeXd26dkj7uo/b/PtwK3749DJmZM3bzX88Qvq8Y63Cv+9/NqgKZpob3t++aTo9Zv/x28cftnxR+CABp5XoIBIiFddXIe9ZVoW7GXUXIUsVQYhWBJawKB1RpWW4UEbZtAhchEOI9SJSjyn2mDC7WXffiK6tlpt1JE43HXI+QbgeCkmyKOGue3VG3RBqpdeiAha6OB9ObbomVz1sSXjhTS6WOWNAX5XJGxkxZjkjB9W5RoON2am43XL0WUhix7WcCaVXSbGzJWQKffkm1o4J2eaUF7FXZ9jDqrnCoX9yCSZgdbpJZcoOrInjEICZ+NskopJp6ONounCoUoeaWWldzZZATeRTjZpcmFihyqmKob1jqGCKhQqrAfGqCU7lta60aisYQrqlO55oB2vQwKqVJy3/0Jq5IRtrsfhrL0au2iryOb6IqvYliqtn9wS+SiwzRIbG7TfIuvQtm7O6ZtkxW75KqfR5clumb/Wui2I4v7pHan1Nnjvu7Immq2/uiI5Xao7jpuCwAUrOi/CGry6MKUtOGwraQ+ONLHCDOd7bLt2UosnxzjuW6jF8O6KK4WSqLlrxSVbC2bALDNLaMuM7qbsaD066WqsOeOc6ZpRHuxzeys/u/NPXdVM38Y0E21mzDA3zeaS15prItd4WP2nztauWuO5ItuAsYAJdvi01xaDDDSrwr4san78MiylvZ1m3fZ2Wbrc9ZdUGq1pw3wP/qm3ZTuNeNB+s+DpnYiOrR+pYv9jfOrcJY7M9s2XJk2w4Y8jDWqx6yoOuI+eF46W26qqzrTGm+b53+qQu552uYLH7mbtsd8++sPVmk4v6sP+/fsLxKNcercdm0w43LSma27krEvdN74eq7A8yc37Si70uns/sLbb80z1sZfbPkO8WBIuM+ZSO0Q/3gmjvPj48YN9bvf1q6y+xL1Nfx/jn77MlzwAho9k+XMcec72OtH4L1wP/NrR7ja8tVWvcd+hGMS2FDh0wU5r6uIghoKXKeBVEIPoO54HZ3fBmR1QhSGEH8ROJ8HUZatn0pshdBpIvrpN639Fw9LSVlglIuaNUK1LYBFjeMQQ1pBP4FogEbMHg83/Ra1ReTHY8xBIOQUmS2k/PN8Snwg6ud3vegv8WQRTGLKryS5lEWMjeNSGxBfWcW5efGMXlYfHKaLwjOsLXb/Kp0TOHc6J8hPjvzIGQgoS0mXy0uIbeXi+HpJOkpsc2s4sZ0D7sfCMkklkBj83wQEaEml61GQbU+U+v/Uua6asox6POLnJTdKFs7qlt04VSwYKEI51S2X/zGhBEXKxk5C8IS05GS3wTe+XFAxmH6/4vvQBjHvP3KHzkFe4zvEOlq475CirSc4q2hJI6MRfOZ0VxozJa1U+3OLMrNm+dNLNj+1Upjw1KMtF2tE7uTQh9r4JSnV+z5/uUhIWDypNbCpU/5ERtVlAsYZCU81vhLvcpwqjp0M0HrCS48vdKrkpzYee05uf/KBL7SmzhjpQnAztJ0idGJ9tis6fKhUpRHlaUv41cqcdNWkaqTfIl4Jznohkpg09qb2KslSNYUOmCHSp1FnO1KrEbGEoMudUAkK1eyV0oObeGU2tITWcCIXmHimqVkAeaK0j3SDzyqjOskUSptScalmDeEnaGTGZOb0nFWs61T+eMq4ojacbGTfOyNqNnzqlofHCk9CoAhWjSISgZVn4WEqujqwh7RlYQUvGsY52tbzMKFqnqVNLalSVabzpZgFbSr11lbSSY19VJWvMLIYSqmuVrWhTqs2uCveku/9l7dYYmVyoKbepOdwdY9EI2Q4KNHuuNNtPM0s2DmL1t/v0pRW/68xlcXa82CWaee/o2t62dmrWLWpqp2sETMZ3oP4ZLHGXoF+2JrVahZUof9F2WNOusbAFheIQAqzYk123wZ21KGblCMS6XvS5JGzrKyXW3uPFtK+GnascP3rf2QZ2v8GkKR/LF1rxMZeurCytQD/rXdQOOIkbTSspRQlfOxZmxATucY6bWdl7mdOnjhxZPY8Mwe7+uDiXXTKE4TllysKWySuucHXnGGXnvje3Oqaqlk8IZt3yFrEX62aXifzPicZWzFwlM5eN2sSjMlOQHs3n5+iJXtqy13pZljLmXH0nYA7XksHJlSJhq6xUGgt6mITeM5CtbFAm1ljEke5vS+e84wj39K9rZnRejwtGQy+2P2kttafnmF1JfwbSTV4mDCcs2Pr2c6939m+cU81OIaZXs2OGiY9t6tAb47W2h4Vznpf84sSeeNlDNvaZ43jsW1M42l2uNpVrHWRoT1va5OXzI4MF4xQHMqu5NjNTyb3TGCuI3acO3bt/jWIQ4zHNwqbtuTd94GPqe92a7vebSYzmESl84QxvuMMfDvGIS3ziFK+4xS+O8YxrfOMc77jHPw7ykIt85CQvuclPjvKUqzwJBQAAOw==';

    img1.src = 'data:image/png;base64,' + src;
}

export default connect(null, { notify, finalizePayment, sendPrintApi, updateFinalizePayment, fetchFinalizePaymentFromIndexedDB, SavePendingFinalizePayment })(Payment);
