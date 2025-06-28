# استخدم صورة رسمية من Python
FROM python:3.11-slim

# حدد مجلد العمل داخل الحاوية
WORKDIR /app

# تثبيت الحزم اللازمة لبناء بعض المكتبات
RUN apt-get update -qq && \
    apt-get install -y --no-install-recommends \
    build-essential \
    python3-dev \
    && apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# نسخ الملفات إلى داخل الحاوية
COPY . /app

# تثبيت المتطلبات
RUN pip install --no-cache-dir -r requirements.txt

# فتح المنفذ 5000
EXPOSE 5000

# الأمر الذي يتم تنفيذه عند تشغيل الحاوية
CMD ["python", "api.py"]
