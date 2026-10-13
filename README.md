# AE86 Dynamic Island — starter project

A starter iOS app and Live Activity for an AE86 Panda-style car.

## What this project does
- Provides a SwiftUI app with a button to start and stop a Live Activity.
- Provides a WidgetKit Live Activity UI for the Lock Screen and Dynamic Island.
- Uses the included AE86 image.

## Important limitations
- iOS controls the Dynamic Island layout and update behavior. This is not a continuous high-frame-rate animation engine.
- The GitHub Actions workflow builds for the iOS Simulator without signing. It does **not** produce an app that can simply be installed on a physical iPhone.
- Installing on a real iPhone requires Apple signing/provisioning. Do not upload Apple account passwords or certificates to this repository.

## Build in GitHub Actions
After uploading these files to your GitHub repository, open the **Actions** tab. The workflow runs when files are pushed to `main` or when started manually. The build log and simulator build result will appear there.
