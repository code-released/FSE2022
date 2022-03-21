APK_FOLDER='apks'
OUTPUT_DIR='tf_apps_output_1'
DEVICE='192.168.144.101:5555'

# automated explore apk
python apk_explore.py --apk_folder $APK_FOLDER \
                        --output_dir $OUTPUT_DIR \
                        --timeout 300 \
                        --d $DEVICE

# meanwhile, to capture the screen recording, run the command in screenrecord.bat