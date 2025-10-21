# Disaster Tweet Classification

This folder contains my experiments for Kaggle's ["Real or Not? NLP with Disaster Tweets"](https://www.kaggle.com/competitions/nlp-getting-started) competition. The goal is to predict whether a tweet refers to an actual disaster (label `1`) or not (label `0`).

## Contents
- `disaster-tweet-prediction.ipynb` – a Jupyter notebook that walks through the full workflow, from exploratory analysis and baseline bag-of-words models to Word2Vec, GloVe, and a convolutional neural network.

## Usage
Open the notebook in Jupyter (or Kaggle Notebooks) to run the experiments. The notebook expects the competition data to be available at the default Kaggle paths (e.g., `/kaggle/input/nlp-getting-started/`). When running locally, download the datasets from Kaggle and adjust the file paths accordingly.

## Notes
- The notebook includes markdown sections that explain the motivation for each modeling approach and summarize key takeaways.
- Some sections (e.g., BERT fine-tuning) require additional dependencies or GPU resources; see the inline comments before running those cells.
