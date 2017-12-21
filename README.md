# GCSFUSE on Docker

## Usage

```bash
$ docker run --privileged -it \
	-v /path/to/key_file.json:/sec/key.json \
	-e GCS_BUCKET=my_bucket \
	-e KEY_FILE=/sec/key.json \
	-e MOUNT_DIR=/share \
	-w /share
	blue1st/gcsfuse sh
```
