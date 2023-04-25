"""
Main script that calls remove_stateless_resource from loadbalancer
"""
import sys
import logging
import remove_loadbalancer_stateless_resources as loadbalancer # pylint: disable=import-error
import remove_route53_stateless_resources as route53 # pylint: disable=import-error

logging.basicConfig(
    format='{"asctime": "%(asctime)s", "name": "%(name)s", "loglevel":"%(levelname)s", "message":"%(message)s"}', # pylint: disable=line-too-long
    level=logging.INFO
)

if __name__ == "__main__":
    try:
        #LoadBalancer
        logging.info("Starting Load Balancer destroy...")
        loadbalancer.remove_stateless_resources()
        logging.info("Finished Load Balancer destroy...")
        #Route53
        logging.info("Starting Route53 destroy...")
        route53_client = route53.connect_client()
        stateless_dns_record = route53.enumerate_records(route53_client)
        for record in stateless_dns_record:
            route53.delete_record(route53_client, record)
        logging.info("Finished Route53 destroy...")
    except Exception as ex: # pylint: disable=broad-exception-caught
        logging.error("General error on stateless.py: %s", ex)
        sys.exit(0)
