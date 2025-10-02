FROM jupyter/scipy-notebook:latest

# Switch to root to install system deps if needed
USER root

# Install BigQuery + GCP libraries + Jupyter plugin
RUN pip install --no-cache-dir \
    google-cloud-bigquery \
    google-cloud-storage \
    google-cloud-bigquery-storage \
    db-dtypes \
    pandas-gbq 

# Install Jupyter BQ plugin (not ready)
# RUN pip install --no-cache-dir bigquery-jupyter-plugin
# Enable JupyterLab plugin (only needed for some versions of JupyterLab < 4.0)
# RUN jupyter server extension enable bigquery_jupyter_plugin

# Switch back to Jupyter user (very important for security!)
USER $NB_UID