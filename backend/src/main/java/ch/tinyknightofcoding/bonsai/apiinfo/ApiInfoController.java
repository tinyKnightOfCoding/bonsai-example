package ch.tinyknightofcoding.bonsai.apiinfo;

import ch.tinyknightofcoding.bonsai.api.ApiInfoApi;
import ch.tinyknightofcoding.bonsai.model.ApiInfoDto;
import org.springframework.boot.info.BuildProperties;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RestController;

@RestController
record ApiInfoController(BuildProperties buildProperties) implements ApiInfoApi {

    @Override
    public ResponseEntity<ApiInfoDto> apiInfoGet() {
        var apiInfo = new ApiInfoDto();
        apiInfo.name(buildProperties.getArtifact()).version(buildProperties.getVersion());
        return ResponseEntity.ok(apiInfo);
    }
}
