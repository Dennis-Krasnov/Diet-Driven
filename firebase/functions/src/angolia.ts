// import * as functions from "firebase-functions";
import {verifyString} from "./utils";
import {CallableContext} from "firebase-functions/lib/providers/https";

// Import syntax breaks at runtime.
// const algoliasearch = require('algoliasearch/lite');
// const client = algoliasearch(functions.config().algolia.app_id, functions.config().algolia.admin_key);
// const index = client.initIndex(functions.config().algolia.index_name);

const randomize = require('randomatic');


function randomFoodRecord(query : String) {
    return {
        $: "FoodRecord",
        foodName: `${query} ${randomize('Aa0', 10)})`,
        grams: parseInt(randomize('0', 3)),
        totalNutrients: {
            calories: parseInt(randomize('0', 3)),
            quantities: {}
        //         protein: parseInt(randomize('0', 2)),
        //         fat: parseInt(randomize('0', 2)),
        //         carbs: parseInt(randomize('0', 2)),
        }
    };
}

export async function handleSearchFoodsByQuery(data: any, context: CallableContext) {
    // const auth = verifyAuthenticated(context);
    const query = verifyString(data, "query");

    console.log(randomFoodRecord(query));

    return {
        $: "SearchResult",
        foods: Array.from({length: parseInt(randomize('0', 2))}, (v, k) => randomFoodRecord(query)),
        // foods: [],
        pagination: 1
    };

    // return generator(clientsSchema, 5, 20);
    // return a;

    // const results = await index.search({ query: query });
    // return results.hits;
}

// interface JsonData {
//     [x: string]: string|number|boolean|Date|JsonData|JsonDataArray;
// }
// interface JsonDataArray extends Array<string|number|boolean|Date|JsonData|JsonDataArray> { }
//
// /// https://github.com/Marak/faker.js/issues/399#issuecomment-433090692
// const generator = (schema: JsonData, min = 1, max: number) => {
//     const maximum = max || min
//     return Array.from({ length: faker.random.number({ min, maximum }) }).map(() => Object.keys(schema).reduce((entity: JsonData, key) => {
//         entity[key] = faker.fake(schema[key]);
//         return entity;
//     }, {}));
// };

// return index.search({ query: query });
// TODO: move to own file...
/// List of query suggestions based on query.
// export async function handleFoodSuggestions(data: any, context: CallableContext) {
//     const auth = verifyAuthenticated(context);
//     const query = verifyString(data, "query");
//
//     const searchQuery = encodeURIComponent(query);
//     const limit = 10;
//
//     const fetch = require('node-fetch');
//     const response = await fetch(`https://api.edamam.com/auto-complete?q=${searchQuery}&limit=${limit}&app_id=${functions.config().edamam.app_id}&app_key=${functions.config().edamam.app_key}`);
//
//     console.log(`${auth.uid} searched recommendations for query ${query}`);
//
//     return response.json();
// }
//
// // TODO: move to own file...
// export async function handleUpdateSubscription(data: any, context: CallableContext) {
//     const auth = verifyAuthenticated(context);
//     const subscriptionType = verifyString(data, "subscriptionType");
//
//     await db.doc(`users/${auth.uid}`).update({
//         currentSubscription: subscriptionType
//     });
//
//     console.log(`${auth.uid} subscription update to ${subscriptionType}`);
// }