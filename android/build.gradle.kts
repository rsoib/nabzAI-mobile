allprojects {
    repositories {
        google()
        mavenCentral()
    }
}

val newBuildDir: Directory = rootProject.layout.buildDirectory.dir("../../build").get()
rootProject.layout.buildDirectory.value(newBuildDir)

subprojects {
    val newSubprojectBuildDir: Directory = newBuildDir.dir(project.name)
    project.layout.buildDirectory.value(newSubprojectBuildDir)
}
// Some plugins (e.g. health) declare a compileSdk lower than their own
// dependencies require; compile every plugin against SDK 36.
subprojects {
    val forceCompileSdk: Project.() -> Unit = {
        extensions.findByType<com.android.build.gradle.LibraryExtension>()?.compileSdk = 36
    }
    if (state.executed) forceCompileSdk() else afterEvaluate { forceCompileSdk() }
}
subprojects {
    project.evaluationDependsOn(":app")
}

tasks.register<Delete>("clean") {
    delete(rootProject.layout.buildDirectory)
}
