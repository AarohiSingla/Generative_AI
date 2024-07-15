### Check this video : https://youtu.be/VvpuGpXOYrQ

### Environment setup:
    
    py -3.10 -m venv myvenv
    
    myvenv\Scripts\activate
    
    python -m pip install --upgrade pip
    pip install --upgrade --quiet  langchain-google-genai pillow
    pip install streamlit
    pip install python-dotenv
    
    Get a Google API key: 
    Head to https://ai.google.dev/gemini-api/docs/api-key to generate a Google AI API key.



### To run question and answering app:

     streamlit run gemini_app_qa.py


###  To run language translator app:

    streamlit run gemini_applanguage_translator.py
