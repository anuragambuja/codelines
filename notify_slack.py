import json
import logging
import sys
import urllib
import requests


class NotificationHelper:
    def __init__(self, slack_webhook, slack_channel_name):
        self.slack_channel_name = slack_channel_name
        self.slack_webhook = slack_webhook

    def create_slack_message(self, value):
        slack_data = {
            "channel": self.slack_channel_name,
            "attachments": [
                {
                    "color": "danger",
                    "pretext": "pretext.",
                    "author_name": "Author",
                    "title": "title",
                    "fields": [
                        {
                            "title": "sub title",
                            "value": "value",
                            "short": "false"
                        }
                    ]
                }
            ]
        }
        return slack_data

    def notify_slack(self, slack_data):
        """
            notify the slack channel with the message
            Args:
                slack_data: message to be sent. It must contain 'channel' as channel id
                        and 'text' as string
            Returns:
                publishes the message to slack channel or returns the error code
            """
        url: str = ""
        try:
            byte_length = str(sys.getsizeof(slack_data))
            headers = {'Content-Type': "application/json", 'Content-Length': byte_length}
            # converting to string for correct type
            self.slack_webhook = "".join(self.slack_webhook)
            url = urllib.parse.urlparse(self.slack_webhook).geturl()

            response = requests.post(url.strip(), data=json.dumps(slack_data), headers=headers)
            if response.status_code != 200:
                raise Exception(response.status_code, response.text)
        except Exception as ex:
            logging.warning('Publishing to slack failed', ex)

    def push_notification(self, text):
        mesg = self.create_slack_message(text)
        self.notify_slack(mesg)


NotificationHelper(slack_webhook, slack_channel_name).push_notification(text)

