plugins {
    java
    id("org.springframework.boot") version "3.0.0"
    id("io.spring.dependency-management") version "1.1.0"
    id("org.openapi.generator") version "6.2.1"
}

java.sourceCompatibility = JavaVersion.VERSION_17


springBoot {
    buildInfo()
}

openApiGenerate {
    generatorName.set("spring")
    inputSpec.set("$rootDir/../api/spec.yaml")
    apiPackage.set("ch.tinyknightofcoding.bonsai.api")
    modelPackage.set("ch.tinyknightofcoding.bonsai.model")
    invokerPackage.set("ch.tinyknightofcoding.bonsai")
    generateApiTests.set(false)
    supportingFilesConstrainedTo.set(listOf())
    generateApiDocumentation.set(false)
    generateModelDocumentation.set(false)
    modelNameSuffix.set("Dto")
    outputDir.set("$buildDir/generated-sources")
    configOptions.set(
        mutableMapOf(
            "interfaceOnly" to "true",
            "documentationProvider" to "none",
            "exceptionHandler" to "false",
            "enumPropertyNaming" to "UPPERCASE",
            "skipDefaultInterface" to "true",
            "useSpringBoot3" to "true"
        )
    )
}

java {
    sourceSets {
        main {
            java {
                srcDir("$buildDir/generated-sources/src/main/java")
            }
        }
    }
}

dependencies {
    implementation("org.springframework.boot:spring-boot-starter")
    implementation("org.springframework.boot:spring-boot-starter-web")
    implementation("org.openapitools:jackson-databind-nullable:0.2.4")
    testImplementation("org.springframework.boot:spring-boot-starter-test")
    compileOnly("org.projectlombok:lombok")
    compileOnly("jakarta.validation:jakarta.validation-api")
    annotationProcessor("org.projectlombok:lombok")
    testCompileOnly("org.projectlombok:lombok")
    testAnnotationProcessor("org.projectlombok:lombok")
}

tasks.withType<Test> {
    useJUnitPlatform()
}

tasks {
    bootJar {
        archiveFileName.set("app.jar")
    }
    compileJava {
        dependsOn.add(openApiGenerate)
    }
}

repositories {
    mavenCentral()
}