import socket
import os
from telegram import Update
from telegram.ext import ApplicationBuilder, CommandHandler, ContextTypes
from dotenv import load_dotenv

# Load environment variables
load_dotenv('./secrets/not-secrets')

BOT_TOKEN = os.getenv("TELEGRAM_TOKEN")
CHAT_ID = os.getenv("TELEGRAM_CHAT_ID")  # Add your chat ID here

# Function to check if port 443 on localhost is responding
def check_port(host, port):
    with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as sock:
        sock.settimeout(1)
        result = sock.connect_ex((host, port))
        return result == 0

# Function to send a message to a specific user via the Telegram bot
async def send_alert(context: ContextTypes.DEFAULT_TYPE) -> None:
    await context.bot.send_message(chat_id=CHAT_ID, text="Port 443 on localhost is down!")

# Command handler for /hello command
async def hello(update: Update, context: ContextTypes.DEFAULT_TYPE) -> None:
    await update.message.reply_text(f'Hello {update.effective_user.first_name}')

# Main function to check the port and send alert if down
async def monitor_port(context: ContextTypes.DEFAULT_TYPE):
    if not check_port("127.0.0.1", 443):
        await send_alert(context)

# Set up the bot application
app = ApplicationBuilder().token(BOT_TOKEN).build()

# Add the /hello command handler
app.add_handler(CommandHandler("hello", hello))

# Periodically check the port (every 60 seconds)
job_queue = app.job_queue
job_queue.run_repeating(monitor_port, interval=60, first=10)

# Start the bot
app.run_polling()
