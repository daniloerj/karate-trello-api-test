package trello.lists;

import com.intuit.karate.junit5.Karate;

public class ListRunner {

    @Karate.Test
    Karate testAll() {
        return Karate.run().relativeTo(getClass());
    }
}
