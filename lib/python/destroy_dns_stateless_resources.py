"""
Main script that removes route53 external-dns resources,
this script should be run alongside Terraform Destroy, being a complement to the process
"""
import sys
import logging
import time
import remove_route53_stateless_resources as route53 # pylint: disable=import-error

logging.basicConfig(
    format='{"asctime": "%(asctime)s", "name": "%(name)s", "loglevel":"%(levelname)s", "message":"%(message)s"}', # pylint: disable=line-too-long
    level=logging.INFO
)

def remove_route53_resources():
    logging.info("Starting Route53 destroy...")
    route53_client = route53.connect_client()
    route53_remaining_resources = route53.enumerate_records(route53_client)
    if route53_remaining_resources is None:
        route53_remaining_resources = []
    for record in route53_remaining_resources:
        route53.delete_record(route53_client, record)
    while (len(route53_remaining_resources) > 0):
        route53_client = route53.connect_client()
        route53_remaining_resources = route53.enumerate_records(route53_client)
        if route53_remaining_resources is None:
            route53_remaining_resources = []
        for record in route53_remaining_resources:
            route53.delete_record(route53_client, record)
        time.sleep(60)
        logging.critical("Route53 Remaining Resources: %s", str(route53_remaining_resources))
    logging.info("Finished Route53 destroy...")

if __name__ == "__main__":
    try:
        remove_route53_resources()
    except Exception as ex: # pylint: disable=broad-exception-caught
        logging.error("General error on stateless functions: %s", ex)
        sys.exit(0)