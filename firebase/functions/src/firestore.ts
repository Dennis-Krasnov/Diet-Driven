import {Change, EventContext} from "firebase-functions";
import {DocumentSnapshot} from "firebase-functions/lib/providers/firestore";
import {verifyEmptyArray} from "./utils";

/// Shorthand for firestore data.
declare type DD = FirebaseFirestore.DocumentData;

///   ########  #######   #######  ########        ########  ####    ###    ########  ##    ##       ########     ###    ##    ##
///   ##       ##     ## ##     ## ##     ##       ##     ##  ##    ## ##   ##     ##  ##  ##        ##     ##   ## ##    ##  ##
///   ##       ##     ## ##     ## ##     ##       ##     ##  ##   ##   ##  ##     ##   ####         ##     ##  ##   ##    ####
///   ######   ##     ## ##     ## ##     ##       ##     ##  ##  ##     ## ########     ##          ##     ## ##     ##    ##
///   ##       ##     ## ##     ## ##     ##       ##     ##  ##  ######### ##   ##      ##          ##     ## #########    ##
///   ##       ##     ## ##     ## ##     ##       ##     ##  ##  ##     ## ##    ##     ##          ##     ## ##     ##    ##
///   ##        #######   #######  ########        ########  #### ##     ## ##     ##    ##          ########  ##     ##    ##

export async function handleFoodDiaryDayCreate(snapshot: DocumentSnapshot, context: EventContext) {
    // const userID = context.params.userID;
    // const date = context.params.date;
    //
    // const document = snapshot.data() as DD;

    return null;
}

export async function handleFoodDiaryDayUpdate(change: Change<DocumentSnapshot>, context: EventContext) {
    const userID = context.params.userID;
    const date = context.params.date;

    const document = change.after.data() as DD;

    /// Delete food diary day if there's no food records left.
    if (document.meals.every((meal: DD) => verifyEmptyArray(meal.foodRecords))) {
        console.log(`Deleted food diary day #${date} for user ${userID}`);

        return change.after.ref.delete();
    }

    return null;
}

export async function handleFoodDiaryDayDelete(snapshot: DocumentSnapshot, context: EventContext) {
    // const userID = context.params.userID;
    // const date = context.params.date;
    //
    // const document = snapshot.data() as DD;

    return null;
}