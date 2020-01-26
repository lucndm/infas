#!/bin/bash
GOOGLE_APPLICATION_CREDENTIALS="/tmp/key.json"

function get_credentials() {
 ACTIVE_CONFIG=$(cat ${HOME}/.config/gcloud/active_config)
 ACTIVE_ACCOUNT=$(cat ${HOME}/.config/gcloud/configurations/config_${ACTIVE_CONFIG} | grep account | awk '{print $3}')
 sqlite3 ${HOME}/.config/gcloud/credentials.db "SELECT value FROM credentials WHERE account_id = '${ACTIVE_ACCOUNT}'" > $GOOGLE_APPLICATION_CREDENTIALS 
}
get_credentials
