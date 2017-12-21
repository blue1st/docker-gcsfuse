#!/bin/sh
mkdir -p ${MOUNT_DIR}
gcsfuse --key-file ${KEY_FILE} ${GCS_BUCKET} ${MOUNT_DIR}
exec $@
