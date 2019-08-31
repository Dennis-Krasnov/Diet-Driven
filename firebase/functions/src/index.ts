import * as functions from "firebase-functions";
import {handleFoodDiaryDayUpdate} from "./firestore";
import {handleAuthenticationCreate, handleAuthenticationDelete} from "./authentication";
import {handleSearchFoodsByQuery} from "./angolia";
import * as admin from "firebase-admin";

/// Google cloud functions written in typescript, bundled with parcel.
/// https://firebase.google.com/docs/functions/typescript
/// https://parceljs.org/

admin.initializeApp(functions.config().firebase);

///    ######  ##        #######  ##     ## ########        ######## #### ########  ########  ######  ########  #######  ########  ########
///   ##    ## ##       ##     ## ##     ## ##     ##       ##        ##  ##     ## ##       ##    ##    ##    ##     ## ##     ## ##
///   ##       ##       ##     ## ##     ## ##     ##       ##        ##  ##     ## ##       ##          ##    ##     ## ##     ## ##
///   ##       ##       ##     ## ##     ## ##     ##       ######    ##  ########  ######    ######     ##    ##     ## ########  ######
///   ##       ##       ##     ## ##     ## ##     ##       ##        ##  ##   ##   ##             ##    ##    ##     ## ##   ##   ##
///   ##    ## ##       ##     ## ##     ## ##     ##       ##        ##  ##    ##  ##       ##    ##    ##    ##     ## ##    ##  ##
///    ######  ########  #######   #######  ########        ##       #### ##     ## ########  ######     ##     #######  ##     ## ########

// const userDocumentPath = "users/{userID}/...";

/// export const userDocumentUpdateHook = functions.firestore.document(userDocumentPath).onUpdate(handleUserDocumentUpdate);


const foodDiaryDayPath = "users/{userID}/food_diary/{date}";

// export const foodDiaryDayCreateHook = functions.firestore.document(foodDiaryDayPath).onCreate(handleFoodDiaryDayCreate);

export const foodDiaryDayUpdateHook = functions.firestore.document(foodDiaryDayPath).onUpdate(handleFoodDiaryDayUpdate);

// export const foodDiaryDayDeleteHook = functions.firestore.document(foodDiaryDayPath).onDelete(handleFoodDiaryDayDelete);

///   ######## #### ########  ######## ########     ###     ######  ########          ###    ##     ## ######## ##     ##
///   ##        ##  ##     ## ##       ##     ##   ## ##   ##    ## ##               ## ##   ##     ##    ##    ##     ##
///   ##        ##  ##     ## ##       ##     ##  ##   ##  ##       ##              ##   ##  ##     ##    ##    ##     ##
///   ######    ##  ########  ######   ########  ##     ##  ######  ######         ##     ## ##     ##    ##    #########
///   ##        ##  ##   ##   ##       ##     ## #########       ## ##             ######### ##     ##    ##    ##     ##
///   ##        ##  ##    ##  ##       ##     ## ##     ## ##    ## ##             ##     ## ##     ##    ##    ##     ##
///   ##       #### ##     ## ######## ########  ##     ##  ######  ########       ##     ##  #######     ##    ##     ##

export const authenticationCreateHook = functions.auth.user().onCreate(handleAuthenticationCreate);

export const authenticationDeleteHook = functions.auth.user().onDelete(handleAuthenticationDelete);

///    #######  ##    ##        ######     ###    ##       ##
///   ##     ## ###   ##       ##    ##   ## ##   ##       ##
///   ##     ## ####  ##       ##        ##   ##  ##       ##
///   ##     ## ## ## ##       ##       ##     ## ##       ##
///   ##     ## ##  ####       ##       ######### ##       ##
///   ##     ## ##   ###       ##    ## ##     ## ##       ##
///    #######  ##    ##        ######  ##     ## ######## ########

exports.searchFoodsByQuery = functions.https.onCall(handleSearchFoodsByQuery);

// export const foodSuggestions = functions.https.onCall(handleFoodSuggestions);

// export const updateSubscription = functions.https.onCall(handleUpdateSubscription);

