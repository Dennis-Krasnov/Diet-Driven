import {UserRecord} from "firebase-functions/lib/providers/auth";
import * as admin from "firebase-admin";

export async function handleAuthenticationCreate(user: UserRecord) {
    // Creates default user document
    await admin.firestore().doc(`users/${user.uid}`).set({
        $: "UserDocument",
        currentSubscription: "none", // not in use
        staleRemoteConfig: false // not in use
    });

    console.log(`${user.uid} user document created`);
}

export async function handleAuthenticationDelete(user: UserRecord) {
    // UserRecord
    // Deletes user document
    await admin.firestore().doc(`users/${user.uid}`).delete();

    // TODO: delete all other documents
    // TODO: use firebase extensions instead

    // OPTIMIZE:
    // const promises = []
    // for doc in docs: promises.push(doc.delete())
    // const snapshots = await Promise.all(promises)
    console.log(`${user.uid} firestore data deleted`);
}