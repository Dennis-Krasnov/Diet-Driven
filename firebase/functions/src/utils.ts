import * as functions from "firebase-functions";
// FIXME:
// tslint:disable-next-line:no-duplicate-imports
import {CallableContext} from "firebase-functions/lib/providers/https";

export function verifyAuthenticated(context: CallableContext) {
    if (!context.auth) {
        throw new functions.https.HttpsError('unauthenticated', 'The function must be called while authenticated.');
    }
}

export function verifyString(data: any, field: any) : string {
    if (!(typeof data[field] === 'string') || data[field].length === 0) {
        throw new functions.https.HttpsError("invalid-argument", "The function requires argument:" + field);
    }
    return data[field];
}