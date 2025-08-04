import streamlit as st
import psycopg
import pandas as pd
import toml
import urllib.parse
import nbformat
import base64
import re
from pathlib import Path
from streamlit.components.v1 import html

# --- DB-Verbindung ---
def get_connection():
    try:
        secrets = toml.load("your toml path")
        conn = psycopg.connect(
            host=secrets["connections"]["postgres"]["host"],
            port=secrets["connections"]["postgres"]["port"],
            dbname=secrets["connections"]["postgres"]["dbname"],
            user=secrets["connections"]["postgres"]["user"],
            password=secrets["connections"]["postgres"]["password"]
        )
        st.subheader("Willkommen im Warenwirtschaftssystem von 🛒\n your name")
        st.success("Datenbank 'WWS' wurde erfolgreich verbunden!")
        return conn
    except Exception as e:
        st.error(f"Fehler beim Verbinden mit der DB: {e}")
        raise

conn = get_connection()
cur = conn.cursor()

notebook_path = Path("your jupyter notebook path.pynb")
image_folder = notebook_path.parent  # Bild liegt im gleichen Ordner wie Notebook

# Notebook laden
with open(notebook_path, "r", encoding="utf-8") as file:
    nb = nbformat.read(file, as_version=4)

st.subheader("📓 Jupyter Notebook Vorschau")

# Zellen durchgehen
for cell in nb.cells:
    if cell.cell_type == "markdown":
        md = cell.source

        # Suche nach Jupyter-Attachments: ![xyz](attachment:xyz)
        matches = re.findall(r"!\[.*?\]\(attachment:(.*?)\)", md)
        for filename in matches:
            image_path = image_folder / filename
            if image_path.exists():
                st.image(str(image_path), caption=filename)
            else:
                st.warning(f"Bild nicht gefunden: {filename}")

            # Entferne das Markdown-Bild-Tag aus dem Text
            md = re.sub(rf"!\[.*?\]\(attachment:{re.escape(filename)}\)", "", md)

        # Restliche Markdown anzeigen
        st.markdown(md, unsafe_allow_html=True)

    elif cell.cell_type == "code":
        st.code(cell.source, language="python")
        for output in cell.get("outputs", []):
            if output.output_type == "stream":
                styled_output = f"<span style='color:Gainsboro; font-weight: bold;'>{output.text}</span>"
                st.markdown(styled_output, unsafe_allow_html=True)
            elif output.output_type in ("execute_result", "display_data"):
                data = output.get("data", {})
                if "text/plain" in data:
                    styled_output = f"<span style='color:Gainsboro; font-weight: bold;'>{data['text/plain']}</span>"
                    st.markdown(styled_output, unsafe_allow_html=True)


