#!/bin/bash

check_config() {
    local key="$1"
    local expected_value="$2"
    local error_message="$3"

    if ! grep -q "${key}: ${expected_value}" "${PREFIX}/conf/config.yaml"; then
        echo "Error: ${PREFIX}/conf/config.yaml does not contain '${key}: ${expected_value}'. ${error_message}"
        echo "Please refer to the APISIX documentation for deployment modes: https://apisix.apache.org/docs/apisix/deployment-modes/"
        exit 1
    fi
}

check_config "role" "data_plane" "Deployment role must be set to 'data_plane' for standalone mode."
check_config "role_data_plane" "" "Role must be set to 'role_data_plane:' for standalone mode."
check_config "config_provider" "yaml" "Config provider must be set to 'yaml' for standalone mode."
