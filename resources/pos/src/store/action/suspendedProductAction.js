import apiConfig from "../../config/apiConfig";
import {constants, suspendedProductActionType} from "../../constants";

export const suspendedProduct = (suspendedValue, cb) => async (dispatch) => {
    await apiConfig.post(`suspended-sell-note`, suspendedValue)
        .then((response) => {
            dispatch({type: suspendedProductActionType.ADD_SUSPENDED_PRODUCT, payload: response.data.data});
            dispatch({type: constants.ADD_TOAST, payload: {text: response.data.msg, display: true}});
            cb({status: true});
        })
        .catch(({response}) => {
            dispatch({type: constants.ADD_TOAST, payload: {text: response.data.message, display: true}});
        });
};

export const editSuspendedProduct = (suspendedValue, transactionId, cb) => async (dispatch) => {
    await apiConfig.post(`update-suspended-sell?transaction_id=${transactionId}`, suspendedValue)
        .then((response) => {
            dispatch({type: suspendedProductActionType.ADD_SUSPENDED_PRODUCT, payload: response.data.data});
            dispatch({type: constants.ADD_TOAST, payload: {text: response.data.msg, display: true}});
            cb({status: true});
        })
        .catch(({response}) => {
            dispatch({type: constants.ADD_TOAST, payload: {text: response.data.message, display: true}});
        });
};
