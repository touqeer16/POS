import React, { useEffect, useRef, useState } from 'react';
import '../scss/layout.scss';
import { Tab, Tabs } from 'react-bootstrap';
import PropTypes from "prop-types";
import { connect } from "react-redux";
import { deleteTransaction, fetchFinalTransaction, fetchFinalTransactionFromIndexedDB } from "../../store/action/recentTransactionAction";
import { CommonLoading } from "react-loadingg";
import DeleteRecentTransactionModal from "./DeleteRecentTransactionmodal";
import { editSuspendedSales } from "../../store/action/suspendedSalesAction";
import { useReactToPrint } from "react-to-print";
import { ESCAPE_KEYS, useEventListener } from "../../shared/UseEventListener";
import { PrintData, PrintDataDynamicData } from "../Payment/Payment";
import { fetchLoginUser, fetchLoginUserFromIndexDB } from "../../store/action/loginUserAction";
import { sendPrintApi } from "../../../src/store/action/finalizePaymentAction";
import QR from 'qrcode-base64';
import moment from "moment";
import { toFixedTrunc } from "../../shared/CalculateProductPrice";
import { Buffer } from 'buffer';

const RecentTransactionsModal = (props) => {
    const { fetchLoginUser, fetchLoginUserFromIndexDB, user, sendPrintApi, onRecentClickToggleModal, fetchFinalTransaction, fetchFinalTransactionFromIndexedDB, recentTransactions, isLoading, deleteTransaction, editSuspendedSales, closeModal } = props;
    const [isDeleteModal, setIsDeleteModal] = useState(false);
    const [deleteId, setDeleteId] = useState(0);
    const [transactionDetails, setTransactionDetails] = useState(null);
    const [printShow, setPrintShow] = useState(false);
    const [isWifiConnection, setIsWifiConnection] = useState(true);

    const componentRef = useRef();

    const onClickDeleteTransaction = (id) => {
        setIsDeleteModal(!isDeleteModal);
        setDeleteId(id);
    }

    useEffect(() => {
        //every second check internet connection
        const interval = setInterval(() => {
            if (navigator.onLine) {
                setIsWifiConnection(true);
            } else {
                setIsWifiConnection(false);
            }
        }, 1000);

        return () => clearInterval(interval);
    }, []);

    useEffect(() => {


        if (!isWifiConnection) {
            fetchLoginUserFromIndexDB();
            fetchFinalTransactionFromIndexedDB('final');
        } else {
            fetchFinalTransaction('final');
            fetchLoginUser();
        }
    }, []);


    const onChangeRecentTransaction = (status) => {
        if (!isWifiConnection) {
            fetchFinalTransactionFromIndexedDB(status);
        } else {
            fetchFinalTransaction(status);
        }



    };

    const deleteTransactions = (id) => {
        deleteTransaction(id);
        setIsDeleteModal(false);
    };

    const editSuspendSale = (id) => {
        closeModal();
        editSuspendedSales(id);
    };

    const printSuspendSale = (transaction) => {
        setTransactionDetails(transaction);
        setPrintShow(true);
    };

    const handlePrint = useReactToPrint({

        content: () => componentRef.current,
    });

    const loadPrintBlock = () => {
        /* console.log("user>>>", user);
        console.log("transactionDetails>>>", transactionDetails); */
        if (transactionDetails) {
            return (
                <div className={'d-none'}>
                    {

                        // generateDynamicHTML(transactionDetails.print, user)
                        /*  printShow && <PrintData ref={componentRef} paymentPrint={transactionDetails.print} user={user} /> */

                        printShow && < PrintDataDynamicData ref={componentRef} paymentPrint={transactionDetails.print} user={user} sendPrintApi={sendPrintApi} />


                    }
                </div>
            );
        } else {
            console.log("transactionDetails is empty");
        }

    }


    const loadTransactions = (recentTransaction, index) => {
        return (




            <tr className="cursor-pointer recent-modal__recent-row">
                <td className="display_custom_recent_column">
                    {index + 1}
                </td>
                <td className="display_custom_recent_column">
                    {recentTransaction.invoice_no}
                </td>
                <td className="display_custom_recent_column">
                    {recentTransaction.call_no}
                </td>
                <td className="display_custom_recent_column"
                    title={parseFloat(recentTransaction.final_total).toFixed(2)}>
                    {parseFloat(recentTransaction.final_total).toFixed(2)}
                </td>
                <td className="display_icon">
                    {recentTransaction.created_at}
                </td>
                <td className="display_icon">
                    <a href="#" onClick={() => editSuspendSale(recentTransaction.id)} className="delete-sale">
                        <i className="fas fa-pen text-muted fa-lg" aria-hidden="true" title="Click to edit" />
                    </a>

                    <a href="#" onClick={() => onClickDeleteTransaction(recentTransaction.id)}>
                        <i className="fa fa-trash text-danger fa-lg" title="Click to delete" />
                    </a>
                    {isDeleteModal &&
                        <DeleteRecentTransactionModal onClickDeleteTransaction={onClickDeleteTransaction}
                            deleteTransactions={() => deleteTransactions(deleteId)} />}
                    <a href="#" className="print-invoice-link print-icon"
                        onMouseEnter={() => printSuspendSale(recentTransaction)} onClick={handlePrint}>
                        <i className="fa fa-print text-muted fa-lg" aria-hidden="true" title="Click to print" />
                    </a>
                </td>
            </tr>


        )
    };

    const loadRecentTransaction = () => {
        return (
            <div>
                <table className="table bg-white recent-modal__custom-recent-table table-responsive">
                    <thead className="recent-modal__recent-tbody">
                        <tr className="cursor-pointer recent-modal__recent-row">
                            <th className="display_custom_recent_column">Sr#</th>
                            <th className="display_custom_recent_column">Invoice #</th>
                            <th className="display_custom_recent_column">Order #</th>
                            <th className="display_custom_recent_column">Price</th>
                            <th className="display_icon">Date</th>
                            <th className="display_icon">Action</th>
                        </tr>
                    </thead>
                    <tbody className="recent-modal__recent-tbody">
                        {
                            recentTransactions.length !== 0 ? recentTransactions.map((recentTransaction, index) => {
                                return loadTransactions(recentTransaction, index);
                            }) : isLoading ? <CommonLoading /> :
                                <h3 className="text-center py-3 highlight-color">No Recent Transactions Available</h3>
                        }
                    </tbody>
                </table>
            </div>
        )
    };

    // User for Close the model on Escape
    function handler({ key }) {
        if (ESCAPE_KEYS.includes(String(key))) {
            onRecentClickToggleModal();
        }
    }

    // listen a event of keydown for ESCAPE and close a model
    useEventListener('keydown', handler);

    return (
        <div className="recent-modal pos-modal">
            <div
                className="modal-dialog modal-dialog-centered hide-show-dialog">
                <div className="modal-content border-0 px-2 px-sm-4 py-2">
                    <button type="button"
                        className="btn-close custom-close-btn"
                        data-bs-dismiss="modal"
                        aria-label="Close"
                        onClick={onRecentClickToggleModal}
                        onKeyPress={onRecentClickToggleModal}>X
                    </button>
                    <div className="modal-body">
                        <div className="row">
                            <div
                                className="col-lg-11 col-12 border-4 border-lg-end pe-lg-0 pe-sm-4 h-top-75">
                                <div
                                    className="mb-5 pe-lg-2 me-lg-1 mt-0 mt-sm-5 mt-lg-0">
                                    <h5 className="modal-title payment-modal__top-title border-bottom border-4 mb-3 pend-sm-90 mb-sm-4 mb-md-3 mt-sm-0 mt-4"
                                        id="paymentModalLabel">
                                        Recent Transactions
                                    </h5>
                                    <Tabs defaultActiveKey="final" onSelect={(e) => onChangeRecentTransaction(e)}
                                        id="uncontrolled-tab-example" className="recent-tabs mb-3">
                                        {/*<i className="fa fa-check"/>*/}
                                        <Tab eventKey="final" title="Final" value={'final'}>
                                            {loadRecentTransaction()}
                                        </Tab>
                                        {/* <Tab eventKey="quotation" title="Quotation" value={'quotation'}>
                                            {loadRecentTransaction()}
                                        </Tab>
                                        <Tab eventKey="draft" title="Draft" value={'draft'}>
                                            {loadRecentTransaction()}
                                        </Tab> */}
                                        {loadPrintBlock()}
                                    </Tabs>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div className="bg-overlay"
                onClick={onRecentClickToggleModal}
                role="button" tabIndex="0"
                aria-label="background overlay"
                onKeyDown={onRecentClickToggleModal}>{ }</div>
        </div>
    );
};

RecentTransactionsModal.propTypes = {
    fetchFinalTransaction: PropTypes.func,
    fetchFinalTransactionFromIndexedDB: PropTypes.func,
    deleteTransaction: PropTypes.func,
    printTransaction: PropTypes.func,
};

const mapStateToProps = (state) => {
    const { user, recentTransactions, isLoading } = state;
    return { user, recentTransactions, isLoading };
};

export default connect(mapStateToProps, { fetchLoginUser, sendPrintApi, fetchLoginUserFromIndexDB, fetchFinalTransaction, fetchFinalTransactionFromIndexedDB, deleteTransaction, editSuspendedSales })(RecentTransactionsModal);

