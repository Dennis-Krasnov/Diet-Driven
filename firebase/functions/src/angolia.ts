import * as functions from "firebase-functions";
import {verifyAuthenticated, verifyString} from "./utils";
import {db} from "./services";

const edamamBaseUrl = "https://api.edamam.com/";

// List of query suggestions based on query
exports.foodSuggestions = functions.https.onCall(async (data, context) => {
    verifyAuthenticated(context);
    const query = verifyString(data, "query");

    const searchQuery = encodeURIComponent(query);
    const limit = 10;

    const fetch = require('node-fetch');
    const response = await fetch(`${edamamBaseUrl}auto-complete?q=${searchQuery}&limit=${limit}&app_id=${functions.config().edamam.app_id}&app_key=${functions.config().edamam.app_key}`);

    console.log(`recommended for query ${query}`);

    return response.json();
});

// TODO: move to own!
exports.updateSubscription = functions.https.onCall(async (data, context) => {
    verifyAuthenticated(context);
    const subscriptionType = verifyString(data, "subscriptionType");

    const userId = context.auth ? context.auth.uid : "";
    await db.doc(`users/${userId}`).update({
        currentSubscription: subscriptionType
    });

    console.log(`${userId} subscription update to ${subscriptionType}`);
});

// TODO: Number.isInteger("hi")