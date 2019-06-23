import * as functions from 'firebase-functions';
import * as admin from "firebase-admin";
// import 'firebase-functions';

// Google cloud functions using typescript
// https://firebase.google.com/docs/functions/typescript

//
admin.initializeApp(functions.config().firebase);


// https://firebase.google.com/docs/functions/config-env
// firebase functions:config:set someservice.key="THE API KEY" someservice.id="THE CLIENT ID"
// After running `functions:config:set`, you must redeploy functions to make the new configuration available.
// firebase functions:config:get
// functions.config().someservice.key

// const fetch = require('node-fetch');


// const db = admin.firestore();


export const helloWorld = functions.https.onRequest((request, response) => {
 response.send(`Hello: ${functions.config().someservice.key}`);
});
// gcloud functions deploy helloWorld --runtime nodejs8 --trigger-http
// TODO: make external tool with


// Runs at instance cold-start
// const secretKeys = decryptKeys();

//
// const edamamBaseUrl = "https://api.edamam.com/";

// gcloud functions deploy FUNCTION_NAME --env-vars-file .env.yaml
// gcloud functions deploy foodSuggestions --env-vars-file .env.yaml


// exports.foodSuggestions = functions.https.onCall(async (data, context) => {
//     verifyAuthenticated(context);
//     verifyString(data, "query");
//
//     const searchQuery = encodeURIComponent(data["query"]);
//     const limit = 10;
//
//     let response = await fetch(`${edamamBaseUrl}auto-complete?q=${searchQuery}&limit=${limit}&app_id=${appId}&app_key=${appKey}`);
//     return response.json();
// });
//
// function verifyAuthenticated(context) {
//     if (!context.auth) {
//         throw new functions.https.HttpsError('unauthenticated', 'The function must be called while authenticated.');
//     }
// }
//
// function verifyString(data, field) {
//     if (!(typeof data[field] === 'string') || data[field].length === 0) {
//         throw new functions.https.HttpsError("invalid-argument", "The function requires argument:" + field);
//     }
// }
//
// function edamamFailure(error) {
//     throw new functions.https.HttpsError('internal', 'Edamam failed: ' + error);
// }
//
// async function decryptKeys(
//     projectId = 'diet-driven-app',
//     keyRingId = 'diet_driven_key_ring',
//     cryptoKeyId = 'edamam_key',
//     ciphertextFileName = './path/to/plaintext.txt.encrypted', // TODO: read from environment variable!
//     plaintextFileName = './path/to/plaintext.txt.decrypted'
// ) {
//
//     const appKey = "88fbceb07e4fa287b47fefa3db2004f3";
//     const appId = "1c25cea1";
//
//     const fs = require('fs');
//     const {promisify} = require('util');
//
//     // Import the library and create a client
//     const kms = require('@google-cloud/kms');
//     const client = new kms.KeyManagementServiceClient();
//
//     // The location of the crypto key's key ring, e.g. "global"
//     const locationId = 'global';
//
//     // Reads the file to be decrypted
//     const readFile = promisify(fs.readFile);
//     const contentsBuffer = await readFile("mysecret.txt.encrypted");
//     const name = client.cryptoKeyPath(
//         projectId,
//         locationId,
//         keyRingId,
//         cryptoKeyId
//     );
//     const ciphertext = contentsBuffer.toString("base64");
//
//     // Decrypts the file using the specified crypto key
//     const [result] = await client.decrypt({name, ciphertext});
//
//     // Writes the decrypted file to disk TODO: remove this
//     // const writeFile = promisify(fs.writeFile);
//     // await writeFile(plaintextFileName, Buffer.from(result.plaintext, 'base64'));
//     console.log(
//         `Decrypted ${ciphertextFileName}` //, result saved to ${plaintextFileName}.`
//     );
// }


//////////////////////////////////////////////////////////

// if (response.ok)

// gcloud functions deploy NAME --runtime nodejs10 --trigger-http

// gcloud functions deploy helloGET --runtime nodejs8 --trigger-http

// gcloud functions deploy NAME --runtime nodejs8 --trigger-http


//
// const db = admin.firestore();
//
// var docRef = db.collection('users').doc('alovelace');
//
// var setAda = docRef.set({
//     first: 'Ada',
//     last: 'Lovelace',
//     born: 1815
// });

// exports.helloHttp = (req, res) => {
//     const name =
//         req.query && req.query.name
//             ? req.query.name
//             : req.body && req.body.name
//             ? req.body.name
//             : 'World';
//     res.send(`Hello ${escapeHtml(name)}!`);
// };
// req.get('content-type')



// Callable functions.https.onCall functions
// Firebase Authentication and FCM tokens, when available, are automatically included in requests.
// The functions.https.onCall trigger automatically deserializes the request body and validates auth tokens.
// https://firebase.google.com/docs/functions/callable-reference

// // Message text passed from the client.
// const text = data.text;
// const uid = context.auth.uid;
// const name = context.auth.token.name || null;
// const picture = context.auth.token.picture || null;
// const email = context.auth.token.email || null;

// '"data": {"query": "apple"}'


// exports.helloWorld = functions.https.onRequest((req, res) => {
//     res.status(200).send('Hello, World!');
// });


// // FIXME: move error catching to bloc!
// //  TODO: use callable cloud function, use built value's json serializers for deserializion!
// Future<BuiltList<FoodRecord>> searchForFood(String search) async {
//     var encoded = Uri.encodeFull("/food-database/parser?ingr=$search&app_id=$appId&app_key=$appKey");
//     Response response = await _dio.get(encoded);
//
//     var json = Map<String, dynamic>.from(response.data);
//
//     var parsed = json["parsed"];
//     var hints = json["hints"];
//
//     return BuiltList<FoodRecord>(
//         (hints as List).map((json) {
//         var foodRecord = json["food"];
//         print(foodRecord);
//         return FoodRecord((b) => b
// //          ..foodName = foodRecord["foodId"] as String TODO: edamam id
//                 ..foodName = foodRecord["label"] as String
//                 ..grams = 100
//                 ..calories = foodRecord["nutrients"]["ENERC_KCAL"] as num
//                 ..protein = foodRecord["nutrients"]["PROCNT"] as num
//                 ..fat = foodRecord["nutrients"]["FAT"] as num
//                 ..carbs = foodRecord["nutrients"]["CHOCDF"] as num
// //          ..quantity = foodRecord["source"] as String
// //          ..quantity = foodRecord["_links"]["next"]["href"] as String
//             // TODO: noteworthy custom measurements
//
//
// //          ..foodName = foodRecord["image"] as String TODO: image (override with my own in repository)
//         );
//     })
// );
// }
//
// Future<FoodRecord> nutritionalInformation(String edamamFoodId) async {
//     var encoded = Uri.encodeFull("/food-database/nutrients?app_id=$appId&app_key=$appKey");
//     Response response = await _dio.post(
//         encoded,
//         data: {
//         "quantity": 1,
//             "measureURI": "http://www.edamam.com/ontologies/edamam.owl#Measure_unit",
//             "foodId": edamamFoodId
//     }
// );
//
//     var json = Map<String, dynamic>.from(response.data);
//
//     num foodYield = json["yield"];
// //    num calories = json["calories"]; FIXME imprecise
//     num totalWeight = json["totalWeight"];
//
//     List<String> dietLabels = json["dietLabels"];
//     List<String> healthLabels = json["healthLabels"];
//     List<String> cautions = json["cautions"];
//
//     // Per 100 g
//     var nutrients = json["totalNutrients"];
//
//     print(response.statusCode);
//     print(response.data);
//
//     return FoodRecord((b) => b
//         ..foodName = "from edamam" // TODO: take from previous request, keep it's id, etc (pass food record, throw if it doesn't have edamam id)
//         ..grams = 100
//         ..calories = nutrients["ENERC_KCAL"]["quantity"] as num
//         ..protein = nutrients["PROCNT"]["quantity"] as num
//         ..fat = nutrients["FAT"]["quantity"] as num
//         ..carbs = nutrients["CHOCDF"]["quantity"] as num
//
//
//     );
// }
// }
//
