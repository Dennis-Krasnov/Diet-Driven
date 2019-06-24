import * as functions from "firebase-functions";

import {db} from "./services";
// import * as admin from "firebase-admin";

// const db = admin.firestore();

export const createUserHook = functions.auth.user().onCreate(async (user) => {
    // Creates user document
    await db.doc(`users/${user.uid}`).set({
        $: "UserDocument",
        currentSubscription: "none",
        staleRemoteConfig: false // not in use
    });

    console.log(`${user.uid} user document created!`);
});

export const deleteUserHook = functions.auth.user().onDelete(async (user) => {
    // Deletes user document
    await db.doc(`users/${user.uid}`).delete();

    // TODO: delete all other documents


    // OPTIMIZE:
    // const promises = []
    // for doc in docs: promises.push(doc.delete())
    // const snapshots = await Promise.all(promises)
    console.log(`${user.uid} firestore data deleted!`);
});