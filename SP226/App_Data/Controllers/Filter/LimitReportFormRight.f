<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY Identity "LimitReportFormRight">
]>

<dir table="sysreportidright2" code="user_id, controller, report_id" order="user_id, controller, report_id" database="Sys" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="id" allowNulls="false" clientDefault="Default">
      <header v="Chức năng" e="Function"></header>
      <items style="AutoComplete" controller="FunctionReportLookup" reference="description%l" key="limit_right_yn = 1" check="limit_right_yn = 1"/>
    </field>
    <field name="description%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 100, 330"/>
      <item value="111: [id].Label, [id], [description%l]"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf2n4f7jl0jX8hzbsWRhvYc+On9S5oefEl6iw4NanziAh</encrypted>]]>&Identity;<![CDATA[<encrypted>%NmEUrF1m3jr6Ejr66cspTEqMbInsQdbR9rM1CSX0qifUuhdEgWKhjNssK9IKmercWw31hdFDTwvBSZl/Ed+FDw==</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfwSZFYAj65RYzXb1/jCQS7LbKpA54gCakU+hnjiXOE3L</encrypted>]]>&Identity;<![CDATA[<encrypted>%NmEUrF1m3jr6Ejr66cspTEqMbInsQdbR9rM1CSX0qifUuhdEgWKhjNssK9IKmercWw31hdFDTwvBSZl/Ed+FDw==</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6ePvDEiPLJoZDJnB0zrXDohEPpnWhShcWxofVp/tbhFq/qE6u0a1F0cuW1GibuF/bBMwcg0OD2wYVvrN0QgFnbcC6Yn9i+ZEAmc0ECPLHdSksBzuVhj5eVK0P/U0IGRKCvTeLHwHmRVrknNEiE0/U5XfBVOwp3xFnViyxie9l/LO58WbmFKlK6G1Jx/l5TqojpvMKfK+mw5zKpgFRXiZ+gqG5RCkrfpoQHuS9aUZp3X06CYsoqOIHaRnCeJf0mdHqw==</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70A4fLbLV3kHxv6jagmvQXiQmVKU4qOaErPxnpphD6J+4</encrypted>]]>&Identity;<![CDATA[<encrypted>%NmEUrF1m3jr6Ejr66cspTO/0t+xi9XcpWcQ73NzcutO+ltI20JkS+1IxW6RuL376waD01GNmH8gsrJcLEhpyEQ==</encrypted>]]>&Identity;<![CDATA[<encrypted>%NmEUrF1m3jr6Ejr66cspTCCQjWK2T5CTJcKI8WoCF+8/rIXgPQig3W09WYYXWKG/jJauNpDY/PR8cb+dOVfrMt+4q15XcwIElrb70xv8ucE=</encrypted>]]>&Identity;<![CDATA[<encrypted>%NmEUrF1m3jr6Ejr66cspTNa/MhFA6pG3Exq7TRANdSR/CeAfDXAoOm2G1odloZem9lOLVQyUiIaeQK6GPtkQcjh+1LXwabE77ciarzphkiA=</encrypted>]]>&Identity;<![CDATA[<encrypted>%NmEUrF1m3jr6Ejr66cspTCCQjWK2T5CTJcKI8WoCF+9d0h1TPrVJQdFXEAd4kwPiZ8u5aOtvtkRDbYfZgk4WGEZrd8946mahBUAru/duLTs=</encrypted>]]>&Identity;<![CDATA[<encrypted>%NmEUrF1m3jr6Ejr66cspTCCQjWK2T5CTJcKI8WoCF++cWy2fo1deBaHmJGB10o/3PSBPYAUBTwbvBj73bPm4WN88vZNitOfy5Me3Q/m8OTPCcfZSnxCUHA/7jQXZ5k6DDH3npKD8jIL1/eaj8tAqQ8S2Hz1j0cheO+Li+ja0icz6eSwDveKLPsZr9s39REPgZFvlhGQjyAIQUSx61c9DzvkCVZbqOlw9mPehJ4/I/Lib03YAUgeAZv6YX/CkFLuuCNwPNMEHkdqPQ++zmSndiytVkFm/DSvR1NZY4JtRt6nZncmN5pfY7riqcwQJHNG7vfr8wmQp2BA1fdhoarc07rBJksAo/rsWU4G1wlK3bTSv2itHrlEHl9yAmReGYpT8U72VtmH/7zI5BOOM9vUrIMeIVa+MlbAX/uAC8e01+vuTUsUPl02WYOZVpkwjl321S0vVbaFn4gN7H51ZH0drlbzEzhT0wS4rT2afcglWI/vYEGXTo3Nety8PE5zYIHQOnCe88ZsWVXbQxnj1jiK2KQ==</encrypted>]]>
    </text>
  </script>
</dir>