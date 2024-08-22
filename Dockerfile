# Use the official miniconda3 image as the base image
FROM continuumio/miniconda3

# Set the working directory in the container
WORKDIR /app

# Copy the environment.yml file to the working directory
COPY ENV.yml .

# Install the Conda environment specified in environment.yml
RUN conda env create -n python-supervised-learning -f ENV.yml

# Activate the environment and ensure it's in PATH
RUN echo "conda activate python-supervised-learning" >> ~/.bashrc
ENV PATH /opt/conda/envs/python-supervised-learning/bin:$PATH

# Copy your project files into the Docker image
COPY . .

# Expose the port the app runs on
EXPOSE 5001

# Set the default command to run your application
CMD ["python", "src/index.py"]
