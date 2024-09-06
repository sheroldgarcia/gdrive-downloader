
# Google Drive Downloader Docker

This project provides a Docker container that uses `gdown` to download files and directories from Google Drive using IDs specified in a text file.

## Version

1.0

## Release date

2024-07-21

## DOI

[https://doi.org/10.5281/zenodo.13701085](https://doi.org/10.5281/zenodo.13701085)

## Cite as

Silena Herold-Garcia, Humberto L. Varona. (2024). Docker that uses `gdown` to download files and directories from Google Drive (gdrive-downloader). (1.0). Zenodo. https://doi.org/10.5281/zenodo.13701085

## Required Directory Structure

To run this container correctly, your host system should have the following directory structure:

```
/gdrive-download/
│
├── configs/
│   └── gdrive/
│       └── download_list.txt  # File containing the list of Google Drive IDs
│
└── data/                      # Directory where the downloaded files will be stored
```

### Description of Directories and Files

- **`configs/gdrive/download_list.txt`**: This file contains the IDs of the Google Drive files or directories you want to download. Each line should contain a single ID, for example:

  ```
  dir:1A2B3C4D5E6F7G8H9I0J:/data
  file:2Z3X4C5V6B7N8M9L0P1Q:/data/project/documents
  ```

- **`data/`**: Directory where the downloaded files will be stored by the container. Make sure this directory exists before running the container.

## Usage Instructions

### Step 1: Create the Directory Structure

Run the following commands to set up the directory structure on your host system:

```bash
mkdir -p /gdrive-download/configs/gdrive
mkdir -p /gdrive-download/data
touch /gdrive-download/configs/gdrive/download_list.txt
```

Fill `download_list.txt` with the IDs of the Google Drive files you want to download.

### Step 2: Build the Docker Image

From the project directory, build the Docker image using the following command:

```bash
docker build -t gdrive-downloader .
```

### Step 3: Run the Container

Run the Docker container with the following command:

```bash
cd /gdrive-download
docker run --rm -v $(pwd)/configs:/configs -v $(pwd)/data:/data gdrive-downloader
```

### Step 4: Run the Container with /bin/bash

Run bash shell in the Docker container with the following command:

```bash
cd /gdrive-download
docker run -it -v $(pwd)/configs:/configs -v $(pwd)/data:/data gdrive-downloader /bin/bash
```

### Additional Notes

- **Permissions:** Ensure that the permissions of the directories and files allow Docker access, especially if you are running Docker as a non-root user.
- **Verification:** Verify that the IDs in `download_list.txt` are correct and accessible from Google Drive, otherwise, `gdown` will not be able to download the files.

## Common Issues

- **Permission Errors:** Ensure Docker has the appropriate permissions to access the mounted directories.
- **Incorrect IDs:** Verify that the IDs in `download_list.txt` are correctly formatted and accessible.

## Contribution

If you wish to contribute to this project, please open an issue or submit a pull request on [Zenodo](https://zenodo.org/records/13701085). Contributions to enhance the functionality or fix issues are always welcome.

## License

This project is licensed under the MIT License. Feel free to use and modify the code as per the terms of the license.

### IMPORTANT NOTE:

This Docker was developed by specialists at the **Centro de Estudos e Ensaios em Risco e Modelagem Ambiental (CEERMA)** as part of the project identified under Process No.: **APQ-0235-1.08/23**, funded by **FACEPE/APAC**. This Docker was designed to support the **Núcleo de Oceanografia Operacional do Estado de Pernambuco (NOPE) project**.

 It is available for free use by any individual or institution in scientific research, such as scientific articles, technical reports, books, and other scientific documents. It is important to note that proper citation of this Docker is required in the references of any scientific research in which it is used. Additionally, acknowledgments in such scientific articles, technical reports, books, and other scientific documents must explicitly include an acknowledgment to **CEERMA** as an institution.

 For any commercial use of this Docker, it is necessary to contact the coordinator and/or vice-coordinator of the **NOPE** project and **CEERMA** beforehand to establish the corresponding terms and conditions of use.

---

