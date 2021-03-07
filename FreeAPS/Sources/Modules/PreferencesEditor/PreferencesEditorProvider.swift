import Foundation

extension PreferencesEditor {
    final class Provider: BaseProvider, PreferencesEditorProvider {
        @Injected() private var settingsManager: SettingsManager!
        private let processQueue = DispatchQueue(label: "PreferencesEditorProvider.processQueue")

        var preferences: Preferences {
            settingsManager.preferences
        }

        func savePreferences(_ preferences: Preferences) {
            processQueue.async {
                try? self.storage.save(preferences, as: OpenAPS.Settings.preferences)
            }
        }
    }
}
