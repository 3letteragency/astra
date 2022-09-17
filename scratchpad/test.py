import krpc
import logging
import os
import argparse

ASTROS_LOG_LEVEL = os.getenv("ASTROS_LOG_LEVEL", "DEBUG")

logging.basicConfig(level=ASTROS_LOG_LEVEL,
        format='%(asctime)s  %(message)s')

logger = logging.getLogger('AstrOS')

logger.info(f'Starting AstrOS')

client = krpc.connect(name='astra-client', address='localhost', rpc_port=50000, stream_port=50001)
krpc_client_status = client.krpc.get_status()
logging.info(f'kRPC Astra Client Status:\n\n{krpc_client_status}')

parser = argparse.ArgumentParser()

logger.info(f'VAB:')
vab_inventory = client.space_center.launchable_vessels("VAB")
for vessel in vab_inventory:
    logger.info(f'\t{vessel}')

parser.add_argument('--vessel', choices=vab_inventory, default='SpaceX Falcon 9 Block 5')

args = parser.parse_args()

logger.info(f'LAUNCHING: {args.vessel}')
client.space_center.launch_vessel_from_vab(args.vessel)

vessel = client.space_center.active_vessel
logger.info(f'{vessel.name}: ACTIVE')

orbiting_body = vessel.orbit.body
logger.info(f'{vessel.name}, ORBITING: {orbiting_body.name}')

reference_frame = orbiting_body.reference_frame

logger.info(f'REGISTERING STREAMS')

logger.info(f'REGISTERING STREAM: POSITION, "{vessel.name}"')
position = client.add_stream(vessel.position, reference_frame)
logger.info(f'POSITION STREAM TEST: {position()}')

blackbox = vessel.flight()

logger.info(f'REGISTERING STREAM: VELOCITY, "{vessel.name}"')
velocity = client.add_stream(getattr, blackbox, 'velocity')
logger.info(f'VELOCITY STREAM TEST: {velocity()}')
