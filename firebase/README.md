# Firestore
create fb project
install node

(setup flutter ios and android -- firebase app)

firebase-tools

and firebase
firebase login
(init)

google-cloud-sdk
and 'gcloud init'

## Configure environment variables
https://firebase.google.com/docs/functions/config-env
```
firebase functions:config:set \
    edamam.app_id="1c25cea1" \
    edamam.app_key="88fbceb07e4fa287b47fefa3db2004f3"
```

- Must then redeploy functions to make the new configuration available.
- Only lowercase characters are accepted in keys

Check with: ```firebase functions:config:get```

Usage: ```functions.config().someservice.key```