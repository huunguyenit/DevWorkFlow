<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY ScriptTagReport SYSTEM "..\Include\Javascript\TagReport.txt">
  <!ENTITY Identity "MPSRelease">
  <!ENTITY c1 "&lt;div id=&quot;&Identity;&quot; class=&quot;&Identity;&quot; align=&quot;center&quot; onclick=&quot;refresh$&Identity;Form(this);&quot;&gt;">
  <!ENTITY c2 "&lt;/div&gt;">
  <!ENTITY SiteKey " and (not exists(select 1 from syssiterights where user_id = @@userID) or ma_kho in (select ma_kho from syssiterights where user_id = @@userID))">
]>

<dir table="mpkcsx" code="ma_kho" order="ngay_yc, so_ct" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Chuyển đơn hàng sang lệnh sản xuất" e="MO Batch Release"></title>

  <fields>
    <field name="ma_kho" allowNulls="false" width="80" aliasName="a">
      <header v="Mã kho" e="Site"></header>
      <items style="AutoComplete" controller="Site" reference="ten_kho%l" key="ma_dvcs = @@unit and status = '1'&SiteKey;" check="ma_dvcs = @@unit&SiteKey;" information="ma_kho$dmkho.ten_kho%l"/>
      <footer v="&c1;Làm tươi...&c2;" e="&c1;Refresh...&c2;"/>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZU0fWszg7cqdn47gfVQEMamc7ttX/nWkw353+gkXgXuM</encrypted>]]>&Identity;<![CDATA[<encrypted>%MM+rOgNyJSEWR6VShEWERkThO4oUO8SANrEfwMr+v2E=</encrypted>]]></clientScript>
    </field>
    <field name="ten_kho%l">
      <header v="Tên kho" e="Site Name"></header>
    </field>
    <field name="ngay" type="DateTime" dataFormatString="@datetimeFormat" align="left">
      <header v="Ngày hoạch định" e="Planning Date"></header>
    </field>
    <field name="ten_dvcs%l">
      <header v="Đơn vị" e="Unit"></header>
    </field>

    <field name="d1" external="true" clientDefault="0" defaultValue="0" rows="307" categoryIndex="1">
      <header v="" e=""></header>
      <label v="" e=""></label >
      <items style="Grid" controller="MPSReleaseDetail" row="1"/>
    </field>
  </fields>

  <views>
    <view id="Dir" height="367" anchor="3" split="4">
      <item value="100, 100, 337, 8, 58, 50, 100"/>
      <item value="111-101: [ma_kho].Label, [ma_kho], [ma_kho].Description, [ngay].Label, [ngay]"/>
      <item value="110: [ten_kho%l].Label, [ten_kho%l]"/>
      <item value="110: [ten_dvcs%l].Label, [ten_dvcs%l]"/>
      <item value="1: [d1]"/>

      <categories>
        <category index="1" columns="769, 0" anchor="1">
          <header v="Đơn hàng" e="Information"/>
        </category>
      </categories>
    </view>
  </views>

  <commands>
    <command event="Showing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf0DYMYP8gUUCnQ5UnP18Xy09yLIMJffO1kEQxYnnpe6q/yMC+++VGZvdXZTsC06Otbo3YmEeniSMmPbDz72jB9aMaEkv3TeJP8D8f11BPvdeTCpQPbvFK//rWgLzgWWE0gxtdgqlOYXaLilfqBiViA/em6ckxUd6k2qTh5PYgBgWunpsDU3hX+JtvThHqcCCWg==</encrypted>]]>
      </text>
    </command>

    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6WGBEIPBqe0r5iYcammGjAqlGi9uKVy0uXFsJ6BX1Y02TZAIg06IiH5XRurWeVfTSdGIq6Sjzg3nAHyvbxmU24Ya6XyWXumwLkmZ6P3RSnV2flaLe7gXIzZw2vq5zfJ1mHB5kpRhAD9MjuhytLtTfWsM2ukEUxdmnhQ3t+1dFDYIJQENXjoKfjsAZKyc9ZYOwHjXYVrXIbFVv4ZvZ+ojV98dZXBEHV5iGpl3eeIzSZPIj1XR80CcuxMBVZx26mN0VgcD3zWtAp670zaJ2etDV5vC16BBeNcsOcM6rD6IX0OT4GLNIZIHS/w2FfRNse4ttFsuWe4BTn2irzMBDzHjyuae13AdWqUd95cK15HkWYYg0eoTaaBx6bgOMjcXs4u0FWsj9Mq1DXTEn8fIyaqK0TX49mMH0xN0puqZ6pdkSV33tGgQh/eZRiRpJBQb5Uno+E6b2rZwysL2H9jKy1ZWKPbFgb8d+jXiRMgFrif+sB6f</encrypted>]]>
      </text>
    </command>
    &XMLWhenFilterClosing;

    <command event="Checking">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfwlsanKtJmsYmEzf2aTGgThtdCcgJtJagMOUqRTX65tOxEH93Ee2yWbTTQXXlbMyuA==</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70Jm9ipjJmxPMRQmnJy2kiBbusa3EjFd+kj8SHI083yVY2XB2CBumDzgkNIyszG4xbsKmSAO0RUHtbM1sS7Os7A4=</encrypted>]]>&Identity;<![CDATA[<encrypted>%0zykrLrNegqps1ohJUdnjo8+TDrq91MpeMj8LIRD0M5JFPl4cntzNhZZmuBUKhMSO1k3LIctRHW4m+Q968Kipcm22UJs+9X5iBGla3bs0L3bndLCQGxL+F1zqLGLG0eoC2HmT3zDf65j0j+D2rmxFmZfAdHziAEas1KKyfynWShxNUEb/zybnrVEG80fuaBQO21AIkXQ1oE9MjhqdHz+a37L+jlJX8rOHWNVgLoCtZrwZxy2PZcB7a0nUyKPUISBfHbQsJdgWQSFHyC/wl18mHYZopPx6+d5uEqQyasfvHv4CNzAKKDhu1MhbCgwiFHNrFFauZIAy46jXpuQT8jlj1N/mQYxFwgWbS5CTSIOAXM4et/bmmFSHQIKL54YLgD8032IfY2pRF6GACRUI+4GapYqN0Ngd+OJ4jvjOdAn526PbOu/uU15eA2HS0+5WncPiWqePN7XCfFgnzkpO1F/7KV54Ty69KW88I2TqAWIvx47pqIFr3sXiijuUlokIoj+Q3hF7DF6OqdqVuY9DLuvC83eAdkbgnLCx5kYZZPNGQPIG13w1S9cZB7zHcIpfrhp8ffuuo0sQW8nL+P+AF7mXfQljdzhOyhEQlQsGeMZ+G6i5twBnbynffODUdp8spcEy9fUy4JPip5ezmGXvqQMmHsz8TMR0BbwrAC2lOOJht4MvBtp0wOFXdCnd6Be+JeDQAsNLFwvfGEQ5lJmEhDf9SHlFiibsFODVZGmRkqSwJdjcToy0h+GtiCBYhDoFZDOMLXWhpt53Ob7udaUb/APVzQRujeK19rd9tR33ywN84HNIeuAAJrZsJQnDwNTfuT2H2FF9p/4SFK3GkBjBCCm6hqa+swagBjxh7NstXSn4exhKfE+DCrn0DqCNq6xoKrQAxiEpcFenmZ9nbb0Tcn8xGvkEorrPSj2DfeoryTEPwJBeur0HD8t3Pci5UP/wFRBZ5StR2ozK9WEnBBiGem/VCE55xPm12hThlu4+myxtNOGy9GVUI0/++SI+mBB6VybsdQXfLPgBU/WrNa6Ao4I4IahH6Bt24cHEAGcUNjDIhEgiDn41WalGyIhhW63XKKAtP8iNkqk41o06SqRHaoKfBtlYua03vcSyvT58pU/RBO23uKDycdtyFzV2oiCtd/qycNc3liJ8IuhvIU02OusX3a52x3cnGb+3ebafRRVC0ryxt/MznKZNrgnF9KhYa00r9hbX4zquSOpCtQKrne7+Xup5IXbfYaS6+u9ed/jzSKwQzSooylj3AZIKIz+ywlH3mFNSN1m742kSQQ0EM5Nx18jNqCK8mZu/el5QmKm8EdNYHYpNSR2uP87tRDDXerjXB7cAYYpRyodHE65mWWMEV1X3J0dWfW2ZKHkG8hlqmI=</encrypted>]]>&Identity;<![CDATA[<encrypted>%/LyDKBSFIvP0rUoq/wfrlFf8nYe9DiGxo4Ew0P3OzZ7AhO9FPRN83FiyszfPqTYSWXWbsDlBxegK7CxrOUd/AJ4g91UinHAU9h8aqTDCIa6NpCI45zYo/Wzi9d3gL6mGnOKGK9RKIDJJ3jOWlNZb1f4LmfkiRQT9xRyrSw5QK1+V1dNtZaBwPLUmq4YNcmGsrk83N8HoRdq3FIwg+QOEDwF+cXuGXLUibHR08yKJRD6MoT2OFI/MasN+2qJclmHB2voAPWjdKkDJkX25Ft8dbRpoWjjBs1qDKMu4QlIsg2cA/N33mo1vFM5Au25cde0UwQxfON8GiaXewdGK0mAv1RNHbsA4gLJNTl1IR81nna3a3+q6a7A/5l164Yd0I/VJv3IBR2J2kU46jDjGgIjXGi2i4tUxSv/KzqJedvaFYebGq3xnB83dEY0/FlkuFILSP7GRw5pcDK/+lIwp4yQtCjmsgJurLYY2uaaS1bq/XJLixSgMEHOvKl1fbcH1tucjSXPljoMzloxtxpWX0pFyqUE7ax+eCUqgROBYatdjayLRJKPBXsNIELodjbRYu2FOPtFfKMYBbdjJpn/7jZC+cA==</encrypted>]]>&Identity;<![CDATA[<encrypted>%/LyDKBSFIvP0rUoq/wfrlFf8nYe9DiGxo4Ew0P3OzZ4Q8Kf9rd0qGC7KRM2SormruGPZUTYcvTg8VWoIlCa4BerTx1FpWKSoA2SABLS+wAUaDc934IGpXl+cQFLG0lf5pDRx0NxSMVZ6Z1b2fWpOng==</encrypted>]]>&Identity;<![CDATA[<encrypted>%/LyDKBSFIvP0rUoq/wfrlBfzw4qqUIlzZ0IVqy+RZVvkaxHMC4UxlG3l24wBAJ9z0jQgfyb++Bv7K/nC3sXC7G6X+3pwVnq0OqtT7JoEq24KKAzILXIRgXgo88uxycy1iZ0DDY3vFVAaTjmuEO2dEIgcxXMpkpXV8EEgfBxAEoYqPz+IVaUnmfCadfkVLsyDCrQt79gwSQyXfirVNMcPKQ==</encrypted>]]>&Identity;<![CDATA[<encrypted>%MM+rOgNyJSEWR6VShEWERuNQ2kjxQ/oM9gR/UHKHsM48sIVylz5ryvkvuGHfnSsziDlniCQBDjUgleyEri7sgeyMny+HwjlUhM5mePCcrvVTqxTI53G2GoHYREPyOm7u/atikys972YLjHNjKDsxALptZXGf0M1kAkMeIgiWyjo=</encrypted>]]>&Identity;<![CDATA[<encrypted>%zDp//xMNnZ9m15zxP4+q9CEnwFw7Ur7ltmYGbTGJFEwNZ9i4XlZo2fnXzhrHjP17SQQWTzq7agkRXbdHpPGwYP5kiqJQE9MrxRCMNmsWK9bTWebifEIWRRHDTez7sFrE6fWNBub/7sKINaQvJQk9AFA6YRydk9X2DZMMRh8T/ZSHr6K8qRx710+JVPyObmPAiXMCUI2mzvtKUY2KPdhukcoYsC2tDvovTOAZoOgc8uU2/YK+AXhZEINQdeyV9RDEzW4jGUr0ZeMheXdAz2oyT/s+X17WAPgs2ouoJGqUIIwJTZpHBGoLai7qEZibcNrrjtCglYlDfE43xdCJl9UiMubGwCsLb4fyU6gKVVc7R7wnSdftWGowQX8cm3iVfawGTwmddEKZViQ7zNklQG8O7partN4QARDENsM/wA+Tee1hqg8xgWjYpzYuF/+B5GFcf6v0ful5PJ/errVkFbKbtEMPWwUkzHjx/7yqzjKeZRGkGgvfcGLxKXVMR0RT2dSs81XG3Li7wwdCT0TQot+GY590tAacPLCXmJkgkqoP03VxghoNJn5sjj+AdTOyVz6fQq1R9uagrkBFIDmU0y1nkKVulqukW8BeEOeXMwgeslAL0Gv9ozV7Z92nQtmmKKQuLMkZfIaf96O3BlwC/XtBeIjf4CTSRmjAKkiL2hsQkiY=</encrypted>]]>
      &ScriptTagReport;
    </text>
  </script>

  <css>
    <text>
      <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6TM6fvK7Y059H1vOr4HtdTk=</encrypted>]]>&Identity;<![CDATA[<encrypted>%Kbufz2Ma0t2rOdHaaRlgJZQ+qjAwhIH75YSRc9+nasoIJqbcyJxDUQDeQQgPBMKYzURT4LElQpxCTgFJ1OGNoQ==</encrypted>]]>&Identity;<![CDATA[<encrypted>%4LTJz8GKx3FEGuPX3Q5xYBEN26AeGseo90FeE5x3cjiFJWrjU3LKdAzPfXo8B96T/UzQPaNM9N+ItitSPp1WWv4OzwVhC2jQaY79MNL1GtOx64cHi6/dY2JDgxpWw+yxYOlY40UDHv6JzTVXBzbo9dxMhV7Q93q4xh+gJ1Bnnt8=</encrypted>]]>
    </text>
  </css>

  <response>
    <action id="Release">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6chHApv4+cQaQPDMpTEJ9u/CXtR3WttTm/Hmm3jfp2sQaDQFS2X3UykwI5qbccMRLd27srV7NirNbr/XAA/TA9dpHM/M+LF4iWgm6RKcTdWBkFQsqK4kMI54eWu/ETHnWwdX7jmA6hy3JECLzcutid9NjgzBlwi6BOeFCphTQ++xCR6loGcEbNkYiF17+qJe5DkOsfzNjYe8DgLdFMRIkvO4sk5O3/hq2+6tYJLKS+sojh1cJvxXxDyZk1A77V+USfkRK5guMakj2tv1I7LGbidhe8ql2dJQEA+NHkGL9p2U+6gepxKk49hI1PmZeWRatLsmrjNE5xIaWeg3E4W3fvvaVY25RKkXl0u5+xr+J5BpmEeEeToIhz022oLL3TxXfG52rQK53IBcJjS7gKUNSPZPYAdNWhvVMG/EUTCVs4aJPvJ/WgZTNQhfzNbQtIwUZDkd7r+xV04GFSwri4Qi7w0v/1U6cN5lfdqKF6m6Tb5dZdI/NNs/HYOohMDsiFQ0oaL17C2BGcOWpVPM2bi25miyltsMpK7cT+cvjeltsppaFPbzs2Yth5WE7RvCsXlwX4vzBJITTwA9Razo5+KrQkk5E5UJ4HFDK2rwz/ciEdVLeR4PJvWljg8X3Phx7pBBSrvwpbMSuDcZfsO4RJ6vMz2WDJ3kL7t6oaRULsmAhdUl1cSC/nlbbs2NcU9cRmjQT+rWHhA8OOALJFbo4+W/a78eDTVNlKnyCVkSZILae8qcpmjdc4Wes9MMHJ4T9af9lUP2XZXziUpC1mYyoL7h0RwzAcKE7cZ8Jl4hgfslIOB+SPmEP/45aG+GXeCmFsjHA8IkZgZZakyZ3xsFnzyY1sfjT8/gXWMQsFAKJQMAj57XDcBE6aa0TyXVoa2B1s68BC0K/GuZEMHRuHHHuQYCcC3xYQGWLH+jsSDAJ+A5Gh+QKP1khuYZCf4NShiwSgrS5MbGeVTBu1kDUdB9a5+DuaRrAugLi2IfIu9TrhIa2+Mlg+6t3TFNe9rjdDgEw0ay2TKzGzJYvSZIko4QWDL+dDEmOoOoEz4pSUfb3qJNFejz</encrypted>]]>
      </text>
    </action>

    <action id="Erase">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6WCAabKga5xEvcG+EoimdAa3V95tT7h2W6WhHPGgzKmB4OnJ7G52Fw7rRgpOEKfYZhSTfGCeoIDUtegSo0gkTRTj/5HUVBaOboU7k4C6wml619aEcRHLyw+ZKPpJ2PXPJ7vMWUevEUkKTtdCv/nfk4ZI5KGLpq/QH5l5p0y6JyI4Bsm5NkcX9A6dpOAPCrbjDsy+QZmZoM2DYykxGjx6WixHMAUuN9+rQbMip57ORT5DhVad2YYUIA84otMs/8q6n1diYCAqERNXzRtKShkXmP4=</encrypted>]]>
      </text>
    </action>

    <action id="Site">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6N6bZd6aqVn6AqjRiAHuK7ktMe/arEKiYHTHkNYZjU9oiLrDZnbzMjpeBRstoy1WCwTYudCHE5U/BwX6qan99lMOzEmBFCut/gxzPBeT9QpL3591OEdGWAlXcZHxF2X0kNEi392za7gRQC3vRSa7dYcceGOkpxXEPTAu5aC7dX1</encrypted>]]>
      </text>
    </action>
  </response>

</dir>