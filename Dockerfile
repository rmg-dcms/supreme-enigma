# Use Python 3.6 or later as a base image
FROM python:3.6

# Copy contents into image
COPY app.py .
#COPY nginx.conf .
COPY requirements.txt .

# Install pip dependencies from requirements
RUN pip install -r requirements.txt

# Set YOUR_NAME environment variable
ENV YOUR_NAME=Tim

# Expose the correct port
EXPOSE 5500

# Create an entrypoint
CMD ["flask", "run", "--host", "0.0.0.0", "--port", "5500"]
