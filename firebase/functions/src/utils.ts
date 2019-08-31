import * as functions from "firebase-functions";
import {CallableContext} from "firebase-functions/lib/providers/https";

/// Verifies that current user is authenticated.
export function verifyAuthenticated(context: CallableContext) {
    if (!context.auth) {
        throw new functions.https.HttpsError('unauthenticated', 'The function must be called while authenticated.');
    }
    return context.auth;
}

/// Verifies that data[field] is a typescript string.
export function verifyString(data: any, field: any) : string {
    if (!(typeof data[field] === 'string') || data[field].length === 0) {
        throw new functions.https.HttpsError("invalid-argument", "The function requires argument:" + field);
    }
    return data[field];
}

/// Verifies that data isn't null/undefined.
export function verifyNotNull(data: any) : boolean {
    return !(typeof data === 'undefined' || data === null);
}

/// Checks if data isn't an array or is an empty array.
/// https://stackoverflow.com/a/24403771
export function isInvalidOrEmptyArray(data: any) {
    return !Array.isArray(data) || !data.length;
}

/// Verifies that data is a valid empty array.
export function verifyEmptyArray(data: any) {
    return Array.isArray(data) && !data.length;
}

// TODO: Number.isInteger("hi")