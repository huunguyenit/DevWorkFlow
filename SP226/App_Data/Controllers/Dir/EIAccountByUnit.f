<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE dir [
  <!ENTITY k0 "@ma_dvcs = $ma_dvcs.OldValue and @ngay_hl = $ngay_hl.OldValue">
  <!ENTITY k1 "ma_dvcs = @ma_dvcs and ngay_hl = @ngay_hl">
  <!ENTITY k2 "ma_dvcs = $ma_dvcs.OldValue and ngay_hl = $ngay_hl.OldValue">
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">
]>

<dir table="tkhddtdv" code="ma_dvcs" order="ma_dvcs" xmlns="urn:schemas-fast-com:data-dir">
  <title v="tài khoản kết nối" e="Account Information"></title>
  <fields>
    <field name="ma_dvcs" allowNulls="false" isPrimaryKey="true">
      <header v="Đơn vị" e="Unit"></header>
      <items style="AutoComplete" controller="Unit" reference="ten_dvcs%l" key="status = '1'" check="1 = 1" information="ma_dvcs$dmdvcs.ten_dvcs%l"/>
    </field>
    <field name="ten_dvcs%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ngay_hl" isPrimaryKey="true" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false">
      <header v="Ngày hiệu lực" e="Effective Date"></header>
    </field>
    <field name="ma_kn" allowNulls="false">
      <header v="Tài khoản" e="Account"></header>
      <items style="AutoComplete" controller="EIAccount" reference="ten_kn%l" normal="true" key="status = '1'" check="1 = 1" information="ma_kn$tkhddt.ten_kn%l"/>
    </field>
    <field name="ten_kn%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="status" allowNulls="false" dataFormatString="0, 1" clientDefault="1" align="right" inactivate="true">
      <header v="Trạng thái" e="Status"></header>
      <footer v="1 - Còn sử dụng, 0 - Không còn sử dụng" e="1 - Active, 0 - Inactive"></footer>
      <items style="Mask"/>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 70, 100, 230"/>
      <item value="11010: [ma_dvcs].Label, [ma_dvcs], [ten_dvcs%l]"/>
      <item value="110: [ngay_hl].Label, [ngay_hl]"/>
      <item value="11010: [ma_kn].Label, [ma_kn], [ten_kn%l]"/>
      <item value="111000: [status].Label, [status], [status].Description"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfxtjMLDo8BBJMrArWfQkvNGYv/MbvitZvQh6UeTRUTozivbMtvMwv6FKEKfHTHmrRJMW2Q5U/YXgDLP1eKfnEvM=</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf+SXxKDZcQkHA2om9bQfFJTRXOeGviqkH7jLjp0ypvLCGzc4TbFwTqfwhv7+zX3palmyPKEQ53+NNonnIdNsEaw=</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VvCSBXw+wNCmCS5yYrhlbSaO2S1WV64dNcXidN+Mi1WaN8MSyJECa5wYt3cvTqaIziHZbPp4zAIjBspBaIWaRm2bwxu0QIsEQQhSSwSy9cf+SKoILJvX5FgZ5qq7ewguLg/WJLVS4rnrptUbNk7pxzPWTSdEO8uO3687upWTlGIOHi94zLiNRd+/TAT5NKt4+ZiBVXgbbUUypXYTeZrAylp/kRT9/1BMZPkCiJZLOmFoYjvFndA5NUMJDxIUldBv+w6EgyFtq3S3oqWs08wHbyQ3vcxU4hSiKs7jHC6MyNWnkqhj1dPRuYdldV3JjOvY31RRKh9ICmX+AhF9fmOBsUSxPumlYUk0HTzM2+6z6sGEenVoC95XBYCJwK50PE5b9SWM3pTaz+oWjIEVY4E9vfnNYWIdgVRZHbPStdLZDNEKpkSzZFb9Hd+fbG1hPBfo3O9ILd4azIYeQr+QaMiX+IBaRCDIC7Ax3dTmfVGowvjaGhf5RtbDExkCWzkRaCFDzVYQW7LjEFHc/fj+cWTHiNtnQWk2KWY8NCo0WbaeCgYzz0k2XQ1/Ncz/1p8eXZNxEzOAGH9BvmjTkmL0UdN/OGdtvY9BXqxJQIuLW9snthrFuiWQSpgsTVf2w9ryTYC1Cf6Pc27O4nbbvqNVgcQVIo=</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf8CvhVbfw7+9C5fN1ieQKSuXvQANYDGv9QcCLUW+Mzn0wJz3urcVz6pcq0FHK3Fwx24IlmCRiEzajhOMos39ivitm4X0gevsIRA0LZsVO056h3IErMhhrTU9dspMBaPYhmnUkhZyx4wckD6LxinG6UKQDrrP3SqxY5ICveJ96HRWGHeTYrCb8qpkFgAgCtt/81RTZMjBRi+rVTf2VhXVnsE=</encrypted>]]>&k1;<![CDATA[<encrypted>%cnASWSum4IkRBTbKLOi8cN+5r5DGxhHZBSzn67khvmgCX+9Jr+KibQ8txfwhIDwno81zjJQZL1viHHIMDc52yTt6ZiaWZRegoJdNcGXqRQ626AqZ5hgOQmR0tuVQXCGUeELLJvwIsv2ODyuTTaZ1W2CQ969iV9jg/XPKFZR/BtfhDlZF4I/5+TCFSoBTmqYgsHmbh/ZBPMWhsthlr4Fto5WmlO8GBMSnEd0BhgLJasdUCcETpE4hiG14vesiW6YWyxg3lp/1r6FqyxuT2lxPkw==</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf8CvhVbfw7+9C5fN1ieQKSuXvQANYDGv9QcCLUW+Mzn00MALbX9H22goSHIkMXJSu2q2EtRgK1uAkTZrFAAdInk=</encrypted>]]>&k2;<![CDATA[<encrypted>%ShDm4LooPFnWfxWGAKIehz9ZadEey/2aofs4yZVmKXFKBTORQm7+R4DNOVXwOAkjdE1Y1DZ3sL3O6q7jI7KFVROsW1IbJIr/Fz9mhb+zsYYBWcxz5qa21e9mnHrCAFsyoXTSA2vvDq8DOXdMjXf1z8VgFjpniWMdzGXawh2EzCx4dGGtKjYRwkLFKdkL0eZu+affT1fOMTqquu+kSeGydJenjfAvN4Du6JyaKYiQOfU=</encrypted>]]>&k2;<![CDATA[<encrypted>%cnASWSum4IkRBTbKLOi8cN+5r5DGxhHZBSzn67khvmgCX+9Jr+KibQ8txfwhIDwnKM73fdBkSu8ApL7DvaHSDkR1KBDGflw6/rh1xGfDlCjyh/+3/G3dRnnS3NzxNjMoWnfME0czFmHQNgNkxp2XHijewIU8lzTNAHWf4LcVWnr54ZyrDD48p0HebT2jo7JjWrO+1bD+kz7HWjiAoMgPn0dUFefgPg0d9AeZKJCbvsL2TLCCxcm/tNCSAh18IUOepa4pCneaxmqpg45UL31Jzg==</encrypted>]]>&k0;<![CDATA[<encrypted>%cnASWSum4IkRBTbKLOi8cE/hpETWHna8gLwEu3sbtN6vlz3i6YtEIPeE8os6fQiyqRdrG4uHF58XJ9opPFbeOXFIQP6ZEmV9+r67Mh36xms=</encrypted>]]>&k2;<![CDATA[<encrypted>%ShDm4LooPFnWfxWGAKIehxn5IEU5hwC3K054s/5gYTI=</encrypted>]]>&k1;<![CDATA[<encrypted>%ynJ3B2IMttZ3swIzstMMYbqlZD4zfaX6Mwe4vIA/i8a29Uj1vL+i3p5KfysAi8rKv5W/nX0nml/eKY5vpy5eXLKCSArNUn2VjYa/zuDgwmgOzE7GMQWLEAwomoj+1aPTDN+xQElTr6RRoHpzkjozaQWtxQYhQ3hMy1FGTe7v+lXveEHnoSXDYaQcXP9NROyeFALR6FDkj1RtZCoWUrojzw==</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6XywftI0wqcSBylT7TPC7ogm7xr42354wUsuD7J9STjlPZH3j8Ye5eELAS0GTHkbeqMboCxcWZPqmgVHI4rxdBdE5v2XLyIc5gSWiGIG4xro</encrypted>]]>&k1;
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70HWKfOKEUn0O3JMMpMQdVPY9j/RJ2fTEhUOqH4hW66Lsu6qWsAnBWYgN21rfBLJA6BLkaHC6Z9scjhjIagBk6FKxTNINCs2Q6hbSklGwknyDinPKmru3+8iYbzysFxG43+8itXOcShKAsuyTa+VLtbkL6GujD+kDTg8kx0q5p35uDp474U2h9DcwtPPqIcSZBGs5x2SjSe2gFTg+cIthMuDiREKXNdt/GLMMXax9obdPvuc3yfYHuwPgYklMGrBk1ut1Z+eLrFSaLJ0W/t+t9bTYXpAcRdcKps05xMq0CtCU+Mhwl6Ip842GNfp+gp+oWQB/NeVDzBN3faaT42S0S766a2DvpXuw8CIw4NSS1a0x</encrypted>]]>
      &ScriptIrregular;
    </text>
  </script>

</dir>