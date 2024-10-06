import glob
import sys
import os

EMPTY_FILE_NAME = "empty"

created_empty_file = False

if not os.path.exists(EMPTY_FILE_NAME):
    with open(EMPTY_FILE_NAME, 'w') as empty_file:
        print(f"creating empty file at {EMPTY_FILE_NAME}")
        created_empty_file = True

if len(sys.argv) == 2:
    root = sys.argv[1]
else:
    root = os.getcwd()

print(f"searching directory {root}")

root = "/Users/sinany/S/beans"

# derived from https://stackoverflow.com/a/71401291/6022781

files = glob.glob('**/*.sync-conflict-*', root_dir = root, recursive=True)
files_paths = [_ for _ in files]

for conflict_file in files_paths:
    file_without_conflict = ".".join([segment for segment in
        conflict_file.split(".") if not "sync-conflict" in segment])
    print(conflict_file, file_without_conflict)
    os.system(f"git merge-file {root + '/' + file_without_conflict} {EMPTY_FILE_NAME} {root + '/' + conflict_file}")

if created_empty_file:
    print("deleting the empty file that was created")
    os.remove(EMPTY_FILE_NAME)
