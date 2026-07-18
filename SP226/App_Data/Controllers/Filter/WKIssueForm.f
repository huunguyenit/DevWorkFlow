<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLFlowFormFields SYSTEM "..\Include\XML\FlowFormFields.txt">
  <!ENTITY XMLFlowFormViews SYSTEM "..\Include\XML\FlowFormViews.txt">
  <!ENTITY XMLFlowFormCommand SYSTEM "..\Include\XML\FlowFormCommand.txt">
  <!ENTITY XMLHiddenFields SYSTEM "..\Include\XML\UserDefinedHiddenFieldsDeclare.txt">
  <!ENTITY ScriptFlowFormFunction SYSTEM "..\Include\Javascript\FlowFormFunction.txt">

  <!ENTITY Identity "WKIssue">
  <!ENTITY DetailTable "d66">
  <!ENTITY c11 "Mã khách">
  <!ENTITY c12 "Customer">
  <!ENTITY c21 "Số phiếu xuất">
  <!ENTITY c22 "Pick Number">
  <!ENTITY c31 "Ngày phiếu xuất">
  <!ENTITY c32 "Pick Date">
]>

<dir table="m66$000000" code="stt_rec" order="ngay_ct, so_ct" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Phiếu xuất bán" e="Pick List"></title>
  <fields>
    &XMLFlowFormFields;
  </fields>

  <views>
    &XMLFlowFormViews;
  </views>

  <commands>
    &XMLFlowFormCommand;
  </commands>


  <script>
    <text>
      &ScriptFlowFormFunction;
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70OxtLgDo0Qc9xaVo2DGXWD9uQsOqLbYSTi9QaNQgFC4h</encrypted>]]>&Identity;<![CDATA[<encrypted>%zDp//xMNnZ9m15zxP4+q9O11Ok+FM+pOodAeyr450QWpUKIdOJChu+Z+yqvJnVo+egQXooM/rEveam5B4fAna4apUh+s0sx/BuPysK4P0wwCRe5QT2dq+JHXUEozEIEgBVAI8GWrTHK1dT+eAJopvBGufqTSFIXJdon5DIQUvv99TDqFLqV8hwk9j/QSnSM6HXaUII9E8Adf3ksDiwuDue/u1QaUbmTwK3ozFWcwpk1L1mRHeTofyqPpL87jhd/8HIjRVtwhD9zLuIavvic5zEJYkirltyUH4EiA3OTu1JVbyfnYLfmPWWgTvqpiD47OdnZG+w+PYAw62PA3xch4Ycmk4Nl1YaH/WSUIm9OFpFI92ncCduU3XDz6cY3hMXmQv3hCvd1SDkjA+DDPnPlQg1/dFseFDxHStgOyqiK9dyoUW1Ermkjhq2tUM1EPfEaISHKGzCFTO3xYA8t5SRdCKiuHoeCHrJg9Pb3fj5k949CKcHdrMeQwPYjnR4HNCC88DX46aswK9GvCuUvNYixkhQ==</encrypted>]]>&XMLHiddenFields;<![CDATA[<encrypted>%vnXNQnKFn7dQrzyC5NbwfDTky1YLv+7c10nna3oLp/jzbVWKGK1U0aCy9YQ3r72hViFu+oTkx5gF9REJ5WZaBhnt645wmng3jqhyK5K6MV5kSTznlNtg9t0ZzIZzaiTR8JaozdPIAzkZ36nmkT2rKxDrOJKAk/6nOv0dsfyoZHH/kg4CDoB88F4kptupf+D0etA3BDlFu5NZ9gtcN1KZrsJXFqtkaMtEqst3UKRRGkAiASLijoZQTxQjRfXeft4sgK2r4c03Z8AfLJbjGaSZZjNvVawTIlm31XlNzZiKQ4xC8FykrZ013S+9pR0mnZYpbSnPeR36WUTX3De3jCqtqVh4mP/jNP2U6NfuWo24Kr9PK9B/RkV+VBbOSsg+SRa4x8iIX9Om/c0kzD/JRrCJD5NMRFmQlfVZ6phJXN6xNhL6TmDSA4L8KeQgp3C3aMFuzk/e9BcB8JSoFy2Ija6QqtEfsocEKfoDBWzKkrCKQb2Ms7I0IqwEn9BSn2Wzl+SqfS9kSNbFCxc/Cf18jBV96HoRoBr9Pa9w45yAKMWJ6CgalHt9B6k8IZ+hj6cqkSC5TT+RFKg/4JXRpHKraEkuX+ykEFyGyQ6Dwt2rZgiX161rHF0dNAoxZWEWI/v/dJW3zHvBL8eFRhBFqp3Q3lWNP0cshGomAcb24f0qkZXGXpz7tXMsbo9mhIsQYx13R1u3</encrypted>]]>
    </text>
  </script>
</dir>
