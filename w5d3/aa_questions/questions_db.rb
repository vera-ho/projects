require 'sqlite3'
require 'singleton'

class QuestionsDatabase < SQLite3::Database
    include Singleton

    def initialize
        super('questions.db')
        self.type_translation = true
        self.results_as_hash = true
    end
end

class User
    attr_accessor :id, :fname, :lname

    def self.find_by_id(user_id)
        user = QuestionsDatabase.instance.execute(<<-SQL, user_id)
            SELECT
                *
            FROM
                users
            WHERE
                id = ?
        SQL
        return nil unless user.length > 0
        # p user
        User.new(user.first)
    end

    def self.find_by_name(fname, lname)
        user = QuestionsDatabase.instance.execute(<<-SQL, fname, lname)
            SELECT
                *
            FROM
                users
            WHERE
                fname = ? AND lname = ?
        SQL
        return nil unless user.length > 0
        # p user
        User.new(user.first)
    end

    def initialize(options)
        @id = options['id']
        @fname = options['fname']
        @lname = options['lname']
    end

    def authored_questions
        Question.find_by_author_id(self.id)
    end

    def authored_replies
        Reply.find_by_user_id(self.id)
    end
end

class Question
    attr_accessor :id, :title, :body, :user_id

    def self.find_by_id(question_id)
        question = QuestionsDatabase.instance.execute(<<-SQL, question_id)
            SELECT
                *
            FROM
                questions
            WHERE
                id = ?
        SQL
        return nil unless question.length > 0
        # p user
        Question.new(question.first)
    end

    def self.find_by_author_id(author_id)
        questions = QuestionsDatabase.instance.execute(<<-SQL, author_id)
            SELECT
                *
            FROM
                questions
            WHERE
                user_id = ?
        SQL
        questions.map { |question| Question.new(question) }
    end

    def initialize(options)
        @id = options['id']
        @title = options['title']
        @body = options['body']
        @user_id = options['user_id']
    end

    def author
        name = QuestionsDatabase.instance.execute(<<-SQL, user_id)
            SELECT
                fname, lname
            FROM
                users
            WHERE
                id = ?
        SQL
        # p name
        name.first["fname"] + " " + name.first["lname"] 
    end

    def replies
        replies = Reply.find_by_question_id(self.id)
        # ASK: what do we want to return? Instances or the body of replies?
    end
end

class QuestionFollow
    attr_accessor :id, :user_id, :question_id

    def self.find_by_id(question_follow_id)
        question_follow = QuestionsDatabase.instance.execute(<<-SQL, question_follow_id)
            SELECT
                *
            FROM
                question_follows
            WHERE
                id = ?
        SQL
        return nil unless question_follow.length > 0
        # p user
        QuestionFollow.new(question_follow.first)
    end

    def self.followers_for_question_id(question_id)
        users = QuestionsDatabase.instance.execute(<<-SQL, question_id)
            SELECT 
                users.id
            FROM
                users
            JOIN
                question_follows
                ON 
                    users.id = question_follows.user_id 
            JOIN
                questions
                ON  question_follows.question_id = questions.id
            WHERE
                question_id = ?
        SQL

        users.map{ |user| User.find_by_id(user['id']) }

    end

    def self.followed_questions_for_user_id(user_id)

    def initialize(options)
        @id = options['id']
        @question_id = options['question_id']
        @user_id = options['user_id']
    end


end

class Reply
    attr_accessor :id, :question_id, :parent_reply_id, :user_id, :body

    def self.find_by_id(reply_id)
        reply = QuestionsDatabase.instance.execute(<<-SQL, reply_id)
            SELECT
                *
            FROM
                replies
            WHERE
                id = ?
        SQL
        return nil unless reply.length > 0
        Reply.new(reply.first)
    end

    def self.find_by_user_id(user_id)
        replies = QuestionsDatabase.instance.execute(<<-SQL, user_id)
            SELECT
                *
            FROM
                replies
            WHERE
                user_id = ?
        SQL
        replies.map { |reply| Reply.new(reply) }
    end

    def self.find_by_question_id(question_id)
        replies = QuestionsDatabase.instance.execute(<<-SQL, question_id)
            SELECT
                *
            FROM
                replies
            WHERE
                question_id = ?
        SQL
        replies.map { |reply| Reply.new(reply) }
    end

    def initialize(options)
        @id = options['id']
        @question_id = options['question_id']
        @parent_reply_id = options['parent_reply_id']
        @user_id = options['user_id']
        @body = options['body']
    end
    
    def author
        name = QuestionsDatabase.instance.execute(<<-SQL, user_id)
            SELECT
                fname, lname
            FROM
                users
            WHERE
                id = ?
        SQL
        # p name
        # name.first["fname"] + " " + name.first["lname"] 
        
    end

    def question
        reply_to = QuestionsDatabase.instance.execute(<<-SQL, question_id)
            SELECT
                title, body
            FROM
                questions
            WHERE
                id = ?
        SQL
        # reply_to.first["title"] + ": " + reply_to.first["body"]
    end

    def parent_reply
        Reply.find_by_id(self.parent_reply_id)
    end

    def child_replies
        # query self id as parent id
        replies = QuestionsDatabase.instance.execute(<<-SQL, id)
            SELECT
                *
            FROM
                replies
            WHERE
                parent_reply_id = ?
        SQL
    end
end

class QuestionLike
    attr_accessor :id, :question_id, :user_id

    def self.find_by_id(question_like_id)
        question_like = QuestionsDatabase.instance.execute(<<-SQL, question_like_id)
            SELECT
                *
            FROM
                question_likes
            WHERE
                id = ?
        SQL
        return nil unless question_like.length > 0
        QuestionLike.new(question_like.first)
    end

    def initialize(options)
        @id = options['id']
        @question_id = options['question_id']
        @user_id = options['user_id']
    end

end