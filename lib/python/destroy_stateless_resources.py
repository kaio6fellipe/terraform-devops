"""
Main script that calls remove_stateless_resource from loadbalancer and remove route53 external-dns resources,
this script should be run alongside Terraform Destroy, being a complement to the process
"""
import sys
import logging
import time
import remove_loadbalancer_stateless_resources as loadbalancer # pylint: disable=import-error
import remove_route53_stateless_resources as route53 # pylint: disable=import-error

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
        time.sleep(5)
    logging.info("Finished Load Balancer destroy...")

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
        for record in route53_remaining_resources:
            route53.delete_record(route53_client, record)
        time.sleep(5)
        logging.critical("Route53 Remaining Resources: %s", str(route53_remaining_resources))
    logging.info("Finished Route53 destroy...")

if __name__ == "__main__":
    try:
        #LoadBalancer
        remove_load_balancer_resources()
        #Route53
        remove_route53_resources()
    except Exception as ex: # pylint: disable=broad-exception-caught
        logging.error("General error on stateless.py: %s", ex)
        sys.exit(0)
