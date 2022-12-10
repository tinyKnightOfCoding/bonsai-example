package ch.tinyknightofcoding.bonsai;

import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.ActiveProfiles;

@SpringBootTest
@ActiveProfiles("unittest")
public @interface BonsaiAppTest {
}
