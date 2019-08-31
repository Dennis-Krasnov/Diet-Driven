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
    algolia.app_id="..." \
    algolia.admin_key="..." \
    algolia.index_name="..." \
    edamam.app_id="..." \
    edamam.app_key="..." 
```

- Must then redeploy functions to make the new configuration available.
- Only lowercase characters are accepted in keys

Check with: ```firebase functions:config:get```

Usage: ```functions.config().someservice.key```