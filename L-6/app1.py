from langchain_core.prompts import ChatPromptTemplate
from langchain_ollama.llms import OllamaLLM
import streamlit as st


st.title("LAngchain-LLama3.1 app")

template = """Question: {question}

Answer: Let's think step by step."""

prompt = ChatPromptTemplate.from_template(template)

model = OllamaLLM(model="llama3.1")

chain = prompt | model


question = st.chat_input("Enter your question here")
if question: 
    st.write(chain.invoke({"question": question}))
