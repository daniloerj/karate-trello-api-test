package trello.boards;

import com.intuit.karate.junit5.Karate;

public class BoardRunner {

    @Karate.Test
    Karate testAll() {
        return Karate.run().relativeTo(getClass());
    }

    @Karate.Test
    Karate testClients() {
        return Karate.run("clients").relativeTo(getClass());
    }

    @Karate.Test
    Karate testBoards() {
        return Karate.run("boards").relativeTo(getClass());
    }

    @Karate.Test
    Karate testBoardsSmoke() {
        return Karate.run("boards").tags("smoke").relativeTo(getClass());
    }

    @Karate.Test
    Karate testBoardsRegresion() {
        return Karate.run("boards").tags("regresion").relativeTo(getClass());
    }

    @Karate.Test
    Karate testBoardsRegresionDev() {

        return Karate.run("boards")
                .tags("regresion")
                .karateEnv("dev")
                .relativeTo(getClass());
    }

    @Karate.Test
    Karate testBoardsRegresionUAT() {

        return Karate.run("boards")
                .tags("regresion")
                .karateEnv("uat")
                .relativeTo(getClass());
    }




    @Karate.Test
    Karate testBoardsClase() {
        return Karate.run("boards").tags("clase").relativeTo(getClass());
    }
}
