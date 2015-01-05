import datetime

from django.utils import timezone
from django.test import TestCase
from django.core.urlresolvers import reverse

from polls.models import Question
# Create your tests here.

class QuestionMethodTests(TestCase):
    def test_was_published_recently_with_future_question(self):
        """ Questions with future pub_date should return false"""
        time = timezone.now() + datetime.timedelta(days=30)
        future_question = Question(pub_date=time)
        self.assertEqual(future_question.was_published_recently(), False)

    def test_was_published_recently_with_old_question(self):
        """Questions with pub_date older than 1 day should return false"""
        time = timezone.now() - datetime.timedelta(days=30)
        old_question = Question(pub_date=time)
        self.assertEqual(old_question.was_published_recently(), False)

    def test_was_published_recently_with_recent_question(self): 
        """Questions with pub_date within last day should return True"""
        time = timezone.now() - datetime.timedelta(hours=1)
        recent_question = Question(pub_date=time)
        self.assertEqual(recent_question.was_published_recently(), True)

def create_question(question_text, days): 
    """creates a question that many days out from now, use negative for past"""
    time = timezone.now() + datetime.timedelta(days=days)
    return Question.objects.create(question_text=question_text, pub_date=time)


class QuestionViewTests(TestCase):
    def test_index_view_with_no_questions(self):
        """Gracefully handle when no questions)"""
        response = self.client.get(reverse('polls:index'))
        self.assertEqual(response.status_code, 200)
        self.assertContains(response, "No polls are available")
        self.assertQuerysetEqual(response.context['latest_question_list'], [])

    def test_index_view_with_a_past_question(self):
        """We show questions with past pub_date"""
        create_question(question_text="Past question.", days=-30)
        response = self.client.get(reverse('polls:index'))
        self.assertQuerysetEqual(
            response.context['latest_question_list'], 
            ['<Question: Past question.>']
        )

    def test_index_view_with_a_future_question(self): 
        """Don't show questions with future pub_date"""
        create_question(question_text="Future question.", days=30)
        response = self.client.get(reverse('polls:index'))
        self.assertContains(response, "No polls are available.",
                            status_code=200)
        self.assertQuerysetEqual(response.context['latest_question_list'], [])

    def test_index_view_with_future_question_and_past_question(self):
        """Only show past questions when we have past & future"""
        create_question(question_text="Past question.", days=-30)
        create_question(question_text="Future question.", days=30)
        response = self.client.get(reverse('polls:index'))
        self.assertQuerysetEqual(
            response.context['latest_question_list'], 
            ['<Question: Past question.>']
        )

    def test_index_view_with_two_past_questions(self): 
        """We successfully display multiple past questions"""
        create_question(question_text="Past question 1.", days=-30)
        create_question(question_text="Past question 2.", days=-5)
        response = self.client.get(reverse('polls:index'))
        self.assertQuerysetEqual(
            response.context['latest_question_list'], 
            ['<Question: Past question 2.>', '<Question: Past question 1.>']
        )

class QuestionIndexDetailTests(TestCase): 
    def test_detail_view_with_a_future_question(self): 
        """Detail view for question with future pub_date should 404"""
        future_question = create_question(question_text='Future question.', days=5)
        response = self.client.get(reverse('polls:detail', args=(future_question.id,)))
        self.assertEqual(response.status_code, 404)

    def test_detail_view_with_a_past_question(self): 
        """Detail view for question with past pub_date should display question"""
        past_question= create_question(question_text='Past Question.', days=-5)
        response = self.client.get(reverse('polls:detail', args=(past_question.id, )))
        self.assertContains(response, past_question.question_text, status_code=200)
