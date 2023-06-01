"""
Main script that calls remove_stateless_resource from loadbalancer resources,
this script should be run alongside Terraform Destroy, being a complement to the process
"""
import sys
import logging
import time
import remove_loadbalancer_stateless_resources as loadbalancer # pylint: disable=import-error

logging.basicConfig(
    format='{"asctime": "%(asctime)s", "name": "%(name)s", "loglevel":"%(levelname)s", "message":"%(message)s"}', # pylint: disable=line-too-long
    level=logging.INFO
)

def remove_load_balancer_resources():
    logging.info("Starting Load Balancer destroy...")
    loadbalancer_remaining_resources = loadbalancer.remove_stateless_resources()
    if loadbalancer_remaining_resources is None:
        loadbalancer_remaining_resources = []
    while (len(loadbalancer_remaining_resources) > 0):
        loadbalancer_remaining_resources = loadbalancer.remove_stateless_resources()
        logging.critical("Load Balancer Remaining Resources: %s", str(loadbalancer_remaining_resources))
        time.sleep(60)
    logging.info("Finished Load Balancer destroy...")

if __name__ == "__main__":
    try:
        remove_load_balancer_resources()
    except Exception as ex: # pylint: disable=broad-exception-caught
        logging.error("General error on stateless functions: %s", ex)
        sys.exit(0)

