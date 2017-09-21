#!/bin/bash

selenium-standalone start &
sleep 2
stc $@