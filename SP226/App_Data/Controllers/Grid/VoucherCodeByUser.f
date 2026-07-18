<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE grid [
  <!ENTITY Controller "VoucherCodeByUser">
]>

<grid table="vdmcttransfer" code="ma_ct" order="ma_phan_he, i, ma_ct" filter="wedition &lt;&gt; '9'" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Khai báo danh sách chứng từ chuyển đổi số liệu" e="List of Transaction Data to be copied"></title>
  <subTitle v="Mã phân hệ: %s1 - %s2" e="Module: %s1 - %s2"></subTitle>

  <fields>
    <field name="ma_phan_he" width="100" allowSorting="true" allowFilter="true" readOnly="true">
      <header v="Mã phân hệ" e="Module"></header>
    </field>
    <field name="ma_ct" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true" readOnly="true">
      <header v="Mã chứng từ" e="Code"></header>
    </field>
    <field name="ten_ct%l" width="300" allowSorting="true" allowFilter="true" readOnly="true">
      <header v="Tên chứng từ" e="Description"></header>
    </field>
    <field name="status" type="Boolean" width="80">
      <header v="Chọn" e="Select"></header>
      <clientScript><![CDATA[<Encrypted>&96EB7KSJ4WpQv9tz7CWyJQ/BSbgQreZnW6FL10x89QxGrxaKj2Nb8RCk/RZIEN2A</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&LWEtld0taB4J0SXPL3Rjz6ANypeMQB3Q2Quhewc+cLcIYxqCiVTpuRnVCYWB8tQJ</Encrypted>]]></clientScript>
    </field>
    <field name="i" type="Int16" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_phan_he"/>
      <field name="ma_ct"/>
      <field name="ten_ct%l"/>
      <field name="status"/>

      <field name="i"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcIkDam2OpJKeUPrZ6I5WGFhnaMdP3TwDZh3ymfnifRK0</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&HXzZ47tx/DmldMkWK6w7BCFFW908r2hZG9WaeHd0N3X7ZCFOitHeFmT8S/i7EEImU+xNYwnaN1XigoczZn26BA==</Encrypted>]]>
      </text>
    </command>

    <command event="Scattering">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcMjEitWCiBAWcopg6nypxirG22kVK4Mqm3+MnWVjVq0Q</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&HXzZ47tx/DmldMkWK6w7BCFFW908r2hZG9WaeHd0N3X7ZCFOitHeFmT8S/i7EEImU+xNYwnaN1XigoczZn26BA==</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcMq6Xh7xds9o+3oCl00TufVGLE78mW1GUKVnWVD5XSrl</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&HXzZ47tx/DmldMkWK6w7BCFFW908r2hZG9WaeHd0N3X7ZCFOitHeFmT8S/i7EEImU+xNYwnaN1XigoczZn26BA==</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22ciTfxXLWkc6njlqPxulQ8Q0LC8B5NMqT/jHhfrgr+Va</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&HXzZ47tx/DmldMkWK6w7BEUrsHZmx+y8q8fzOBo+Vnv8PO4xvoTxUmGOhQ8/6qSf2swA9avTaS6Lz/dzGFReUkJW/iSt8dPylO5Way2+Ba9jwrG8F8EaZJ4xjLEREr/WT1t/W6yMrgLf+f3v1a2bk/wtYNTfChZN11oPY+vFdZk=</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&HXzZ47tx/DmldMkWK6w7BJEgTjCN41P0qmtjUnxxg6ZP8kmNu5wlQqNAEUrfli2m/5lVHaZSqPW+j3nO+7C8Y/1/uzF9HYOZV7H7ECskSIs=</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&HXzZ47tx/DmldMkWK6w7BCc188LBDxvAuuuzVL+YKg7anJ+rQAg1uNIGkaoa/PpJF1PPE9AQ4p1OyufxyzU8D/0ljeTsVGMBFBVesaxSmN8=</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&HXzZ47tx/DmldMkWK6w7BKIZALLEdYt+SnOJ3+qjYT6t1941PQSxRgtrkHpcy6YuZZoT9geqbeLIfDk4OrgOKnoP5MMqqUTnPWW04xp8UJs=</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&HXzZ47tx/DmldMkWK6w7BFcmQOrsNzXHQ3Ip3AGFT9czKU8FWsY0magh9orIVrhROoNOQ4u3knXmGcdojyHl+Vz4wapeCDbSXmbLDttX8sI=</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&HXzZ47tx/DmldMkWK6w7BCc188LBDxvAuuuzVL+YKg62g2qCUo/hU1hcVV6dE06eGwKDNzSlaYLQxQnHeqJ3BXfzdWveWDqXo5Ea6EM6yHFO5X9w41sGF8j0B/qsd11d</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&HXzZ47tx/DmldMkWK6w7BJEgTjCN41P0qmtjUnxxg6YLEtdV0MHk5bwR0XPxS1uD9DPacWCTZcMamWsobmI5hm8qStQr1rGI8pB+sGYzPWsf6ZwG1dQyhOjuov8lV8jL</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&LWEtld0taB4J0SXPL3Rjz49Ljqmuc0qIlUIt+ySTNlbAZX4eMzedOEP5vi4pz+merxgmnijM7OHIKQhwqq8Igu+BTgVhlOKcYGYXJ67Jut9DwQXS0vTnAicoCWMt7lK97f8a5GyRSbIedDq06xQXf8CffadVjRuS3Dtf0pimmAcZySBIeNgD2dM6+PgCdtrxML4a9+h7UnjSRW7b9AHRv9BayVp5j4LsqRMV7spwAfXjgVj4A4bzsbed+HOuAHR/fCUF3ZiYsv1SKUPFEt8MgA==</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&HXzZ47tx/DmldMkWK6w7BCc188LBDxvAuuuzVL+YKg69r0U3onXsnXWsLTBTE0EE4PafwhRlVfc5t0Nb6AHs+saHKMC8TAAl1paSxLW3VPG4rU5jwT88icmhjAWdnMwwMOXdrqH+bC5zEh28YP7k1DvWUpW4TbuCipgZFJOvDLX7YFgF2tOGiCSa2JyGzA6cNCZ6ArNxatwauP1pJ73Hqir6Z7+fVboctKRr/pJc30xAiAWTWhObI/8qLxJnqEc1</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&HXzZ47tx/DmldMkWK6w7BJEgTjCN41P0qmtjUnxxg6bmpowyy5R99/WUczOvSOdVfUHionymmCKipZcSnasXlHbNVINMK+Z0q9PWQOCACvOPoTX0F0wTLHNOytsvNZAtKCp3fvA1IbnAG5oHYGpwPuT8D5nhkEO5C0oRdC4rea46FFnmVQQV18XOH8LTJjNeHqwMaJQKUzi3vQ0X57/4uVQfgzZo/2APwhxj3H0743t8OdE5jUnJX813ZGdHukYkoXuIvQe7MHbnkT6Ih74s4IfWmaX9iRZvc2ZJMzrnrTv4bKgQBbfmfWeKMKL+NJrD5e+I98Df/+3v8Zgk8hL7R8jZ/0cjCrj5aTmxN9cHMumldNYwXjMbO3HzG7BapChIZDn97/XJJyMUnLsFQfekmq0IM98zhrMiE9bYreLH9t0ydzF7J6pB0A+qX8B2MPyNiEHFLMkMnwrxdrhoNY3YzWoX+PNRUOevk7BDcpI16p9YC9Qp+tiTEI5ySsIOD85d6Sx88pdavk2hQxw45hSDZZJjWYv7oRK1vUh8GTQu2Ed72Xe8Oi6pz2M/cYtRzdttvQ+UfvFIlbV5c+TqgiU7FD8yb9Y+/0H2DcAdMFGv0f49M29zixeNoHws7vzZVixsVbbsDr8pzcCwJp8zIHeUxyr7d9WWuDlWG9eXh0J+000doP6mZ1TePk9Um51FgkS2n3ObtOs7XgK3DRP3NcmxatUHKAV2d5X34Ic22t+eHoPp4Z25MiN+FfTRCfPnJK+UMe5fdTGLHOElXmLXOzW4qn9Gepu0cLn/nL/mPYTdRPMA4qTTA4yUHBeTgG4ZUW+Hrcyh/0r90RmD7rBv2pH0GYJl9z+18wq3sRH0L/Rt2vWehY7+UNXTWuymPJvS1Mi5</Encrypted>]]>
    </text>
  </script>

  <response>
    <action id="Save">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuwkvyKe8EjaBamo6IH2EgUp8Oe4NBITLVvBUQACPwC9aEi2O+0f+qSGW0qvjxa+DIKQlt0tt1KUISVENcQcmFYBfqa0FS80GVvsotuHvqv1onMXLD4dJkh2kR+nA+Ns0uxp/R8vdzzbSdwv3DfukglE+JCLlph556cZqYnO2ue5/vvyavFpzfBPNgxYH5Sxhm0YV5g1M6+32UkO5GQLZK3ruzgzOgw5Esa1kXrmAqIk9vY1jvHrjbURiLxXWzBVMlrGOPMz7FzwOq5/SooBtHIQ9tS4Ji+/yO6BbJOIs89pEnEQRxXpjPLnR+PC9GzLbmG0NJaxX6HhaJ25nWpyldHtXNWgHr8DscMX7QqN0ssPyccq9+ISpXDqmorkR8ocUaMMwz4EpU8vTMw6d5ZZKE19kcaY51Ui2CnWjSF9pZvmrcYcoa+Spd6nEGIhhxiBaqw==</Encrypted>]]>
      </text>
    </action>
  </response>

  <css>
    <text>
      <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuwNJb7NU+Jv72TBsR/SB74QH6a//Flg9ThtbAxKXedJeJ88OOstDPP2iUxte5HWOgS5N0ocLtsUBsyksWya6czYAqcC4Ty1PsWfAbD7nx6BbdT5oP4PG1ywZeSpUtF0byDhSbx6GAVYTQ1hToZ396sJs4Pl27hHrfyPVQmv3oUvo</Encrypted>]]>
    </text>
  </css>
  <toolbar>
    <button command="Save">
      <title v="Lưu$" e="Save$"></title>
    </button>
    <button command="Search">
      <title v="Toolbar.Search" e="Toolbar.Search"/>
    </button>
    <button command="Export">
      <title v="Toolbar.Export" e="Toolbar.Export"></title>
    </button>
    <button command="Seprate">
      <title v="-" e="-"></title>
    </button>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"></title>
    </button>
  </toolbar>
</grid>