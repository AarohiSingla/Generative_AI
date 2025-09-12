Overview of your project:

```markdown
# AI Supervisor Workflow with LangChain and LangGraph

This project demonstrates the creation of an AI-driven supervisor system that utilizes LangChain, LangGraph, and OpenAI's GPT-4 model to manage two specialized agents. These agents work together to perform various tasks such as research and mathematical operations. The supervisor directs the flow of the tasks, delegating them to the appropriate agents for processing.

## Table of Contents
- [Project Overview](#project-overview)
- [Features](#features)
- [Prerequisites](#prerequisites)
- [Installation](#installation)
- [Setup](#setup)
- [Usage](#usage)
  - [Workflow Example](#workflow-example)
  - [Example Code](#example-code)
  - [Sample Output](#sample-output)
- [License](#license)
- [Acknowledgements](#acknowledgements)

## Project Overview

The AI Supervisor system enables seamless interaction between a **Research Expert Agent** and a **Math Expert Agent**. The supervisor's role is to determine which agent should handle a given task and route the request accordingly.

- **Research Expert Agent**: Capable of performing web searches for research tasks, providing the most relevant and up-to-date information.
- **Math Expert Agent**: Focuses on performing mathematical calculations such as addition, multiplication, and other basic arithmetic operations.

The supervisor decides which agent to invoke based on the type of task received, ensuring efficient workflow and task resolution.

## Features

- **Task Delegation**: Automatically routes tasks to the appropriate agent based on task type (research or math).
- **Web Search**: Research tasks utilize the DuckDuckGo search tool to gather information.
- **Mathematical Operations**: Simple arithmetic operations are handled by the Math Expert Agent.
- **Multi-Agent System**: Implements a two-agent system that can be extended to more agents in the future.
- **AI Integration**: Leverages GPT-4 for reasoning and task orchestration.

## Prerequisites

Before running this project, ensure you have the following prerequisites:

- Python 3.x
- An OpenAI API key (for GPT-4)
- The following Python libraries:
  - `langchain`
  - `langchain_community`
  - `langgraph`
  - `langgraph-supervisor`
  - `langchain-openai`
  - `duckduckgo-search`

To install these libraries, run the following command:

```bash
pip install langchain langchain_community langgraph langgraph-supervisor langchain-openai duckduckgo-search
```

## Installation

1. **Obtain an OpenAI API Key**: To interact with GPT-4, you need to have a valid OpenAI API key. If you don't already have one, you can sign up for API access [here](https://platform.openai.com/).
   
2. **Clone the Repository**: Clone the repository to your local machine by running the following command:

   ```bash
   git clone https://github.com/yourusername/ai-supervisor-workflow.git
   cd ai-supervisor-workflow
   ```

3. **Install Dependencies**: Once you have the project set up, install the required dependencies:

   ```bash
   pip install -r requirements.txt
   ```

## Setup

### API Key Configuration

To use GPT-4, make sure to set your OpenAI API key in your environment variables. You can do this by creating a `.env` file in the project root directory with the following content:

```
OPENAI_API_KEY=your-api-key-here
```

Alternatively, you can directly pass the API key when initializing the OpenAI model in the code.

### Setting Up LangChain and LangGraph

1. **LangChain**: LangChain is a framework that simplifies working with language models. In this project, it is used to integrate GPT-4 into the workflow and handle agent interactions.
   
2. **LangGraph**: LangGraph helps in managing and organizing workflows across multiple agents, ensuring that each task is directed to the correct agent based on the input.

## Usage

### Workflow Example

The core functionality of this system is based on the **Supervisor**, which manages the interactions between the **Research Expert** and **Math Expert** agents. Depending on the input provided by the user, the supervisor routes the query to the correct agent.

#### Task Routing:

1. If the user asks for a research query (e.g., "What is quantum computing?"), the supervisor delegates the task to the **Research Expert Agent**, which uses DuckDuckGo to search for the answer.
2. If the user requests a mathematical operation (e.g., "What is 5 multiplied by 3?"), the supervisor routes the query to the **Math Expert Agent**, which performs the arithmetic operation.

### Example Code

```python
# Importing necessary libraries
from langchain_openai import ChatOpenAI
from langgraph_supervisor import create_supervisor
from langgraph.prebuilt import create_react_agent
from langchain_community.tools import DuckDuckGoSearchRun

# Initialize OpenAI model
model = ChatOpenAI(temperature=0, api_key="your-api-key-here", model="gpt-4")

# Define the agents
research_agent = create_react_agent(
    model=model,
    tools=[DuckDuckGoSearchRun()],
    name="research_expert",
    prompt="You are a world-class researcher with access to web search. Do not do any math."
)

math_agent = create_react_agent(
    model=model,
    tools=[add, multiply],
    name="math_expert",
    prompt="You are a math expert. Always use one tool at a time."
)

# Create supervisor workflow
workflow = create_supervisor(
    [research_agent, math_agent],
    model=model,
    prompt="You are a team supervisor managing a research expert and a math expert. For current events, use research_agent. For math problems, use math_agent."
)

# Compile and run
app = workflow.compile()
result = app.invoke({
    "messages": [
        {
            "role": "user",
            "content": "What is quantum computing?"
        }
    ]
})

# Print result
for m in result["messages"]:
    print(m)
```

### Sample Output

When the user asks "What is quantum computing?", the supervisor routes the request to the **Research Expert**:

```
Quantum computing is a type of computing that utilizes the principles of quantum mechanics. Unlike classical computers that use binary data (0s and 1s), quantum computers use quantum bits, or qubits, which can represent and store data in both 0 and 1 simultaneously...
```

If the user asks a math-related question, such as "What is 12 * 15?", the **Math Expert** handles the calculation:

```
The result of 12 multiplied by 15 is 180.
```

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Acknowledgements

- [LangChain](https://github.com/hwchase17/langchain) - A framework for building language model-powered applications.
- [LangGraph](https://github.com/LangGraph/langgraph) - A tool to manage workflows between multiple agents.
- [OpenAI GPT-4](https://openai.com/gpt-4) - The model used for task reasoning and agent orchestration.
- [DuckDuckGo Search API](https://duckduckgo.com/) - The search tool used by the research agent to gather information.

---

Feel free to clone this repository and extend the system with additional agents or task types. Contributions are welcome!

```

This detailed `README.md` provides an in-depth explanation of the project, including setup, usage, workflow examples, and output. You can adapt this template as needed to fit your specific project.
