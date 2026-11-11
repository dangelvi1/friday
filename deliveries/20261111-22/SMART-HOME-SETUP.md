# Salvador’s house-control setup — planned, not connected

Your devices: WiZ, Philips Hue, Lutron, Resideo/Honeywell, Ring cameras and Ring Alarm, Samsung SmartThings appliances, and Govee lights. Your Echo Show 21 currently controls much of the house through Alexa. An Echo Show is not a Home Assistant server. This FRIDAY update does not install Home Assistant, connect accounts, discover devices, place calls, change appliances or arm/disarm an alarm.

## Recommended connection

Run Home Assistant separately alongside FRIDAY on your PC, or on a dedicated supported Home Assistant device. Keep FRIDAY at S:\AI\friday-ai and its existing Cloudflare voice/dashboard addresses. A local Home Assistant bridge can expose the real connected devices to a future owner-scoped FRIDAY integration, while the Echo Show/Alexa setup stays available.

For a Windows PC, review the official [Windows installation instructions](https://www.home-assistant.io/installation/windows/) and its VM/network requirements. Do not assume the Echo Show can host this software. Installation on Salvador’s actual PC has not been performed or verified from this cloud workspace.

## What needs checking for each brand

| System | Intended connection | Information needed on your PC |
| --- | --- | --- |
| WiZ | Home Assistant WiZ local integration | Light models on the same network; enable **Allow local communication** in the WiZ app. No additional WiZ bridge is normally required. |
| Philips Hue | Home Assistant Philips Hue integration | Whether a Hue Bridge is installed and which version; physical pairing access. Bluetooth-only setups need a separate compatibility decision. |
| Lutron | Home Assistant integration matching the Lutron system | Bridge/processor model from the Lutron app or its label. Caséta, RA2 Select, RadioRA and HomeWorks must not be treated as interchangeable. |
| Resideo/Honeywell | Integration matching thermostat/account family | Thermostat model and whether the app is Resideo/Honeywell Home or Total Connect Comfort; sign in through the selected integration privately. |
| Ring cameras | Home Assistant Ring integration | Camera/doorbell models, account access with private 2FA, supported live-view entities. Last-recording playback/download requires the relevant Ring plan according to the documentation. |
| Ring Alarm | Separate verified alarm-control route | Base station/model and supported integration. Camera connectivity does not verify alarm status or arm/disarm support. A complete Ring Alarm connection is still an open requirement. |
| Samsung SmartThings | Home Assistant SmartThings integration | Appliance models and the actual capabilities exposed for each device. Current documentation flags an October 2026 API subscription change; verify current account terms before authorizing any paid plan. No subscription or spending is authorized here. |
| Govee | Govee local integration for supported models, or verified Matter/other route | Model numbers and whether LAN Control is available/enabled in the Govee app. Do not assume every Govee product supports the same connection. |

## Order of work

1. Install and open Home Assistant locally. Pair the existing supported bridges and accounts through its UI; credentials and 2FA stay out of chat, model arguments, reports and GitHub.
2. Read the real entity inventory and match rooms/device names. Test one light first, then heating and appliances. Confirm actual state changes, not just accepted command responses.
3. Add FRIDAY’s House dashboard and natural voice tool against that verified inventory: lights/scenes, temperature, supported appliance controls, camera views/events and separately verified alarm controls. Until then, these are planned capabilities rather than installed buttons.
4. Reuse FRIDAY’s exact owner-scoped review and contextual voice approval for actions that need approval. The owner session is not biometric voice identification. Device credentials/camera media/alarm codes stay server-side and are never sent to the language model.
5. Use your iPhone Chrome browser at the existing HTTPS FRIDAY address. FRIDAY’s backend talks to the local home bridge; the phone must not call its own localhost or carry device credentials. Any camera stream must be delivered through an authenticated path, with access removed on owner lock.

## Sources checked

Official Home Assistant documentation source was read from the project’s public GitHub repository on November 11, 2026. Direct access to the documentation website was blocked by this workspace’s outbound proxy; the same official source was available on raw.githubusercontent.com. Documentation review is not a live test of Salvador’s devices or a guarantee that every listed function is exposed on his models.

- [WiZ](https://www.home-assistant.io/integrations/wiz/) · [source](https://github.com/home-assistant/home-assistant.io/blob/current/source/_integrations/wiz.markdown)
- [Hue](https://www.home-assistant.io/integrations/hue/)
- [Lutron Caséta and related supported bridges](https://www.home-assistant.io/integrations/lutron_caseta/)
- [Honeywell Total Connect Comfort](https://www.home-assistant.io/integrations/honeywell/) · [Honeywell Home/Lyric](https://www.home-assistant.io/integrations/lyric/)
- [Ring](https://www.home-assistant.io/integrations/ring/)
- [SmartThings](https://www.home-assistant.io/integrations/smartthings/)
- [Govee local](https://www.home-assistant.io/integrations/govee_light_local/)
