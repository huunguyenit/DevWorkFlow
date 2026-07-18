<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY Identity "AccountBalanceImportForm">
  <!ENTITY UploadButtonCss SYSTEM "..\Include\XML\ImageUploadForm.txt">

  <!ENTITY UploadCreateTicket SYSTEM "..\Include\XML\UploadCreateTicket.txt">
  <!ENTITY UploadField SYSTEM "..\Include\XML\UploadField.txt">
  <!ENTITY UploadCommand SYSTEM "..\Include\Command\UploadCommand.txt">
  <!ENTITY UploadScript SYSTEM "..\Include\Javascript\UploadScript.txt">

  <!ENTITY % AccountBalance SYSTEM "..\Include\AccountBalance.ent">
  %AccountBalance;
]>

<dir table="cdtk" code="nam, ma_dvcs, tk" order="nam, ma_dvcs, tk" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Lấy dữ liệu từ tệp" e="Import Data From File"></title>

  <fields>
    &UploadField;
    &OverrideFieldImport;
    <field name="ticket" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 70, 100, 100, 100, 30, 0"/>
      <item value="11000101: [upload].Label, [upload], [upload].Description, [ticket]"/>
      &OverrideViewImport;
    </view>
  </views>

  <commands>
    &UploadCommand;

    <command event="Checking">
      <text>
        <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70OlhMzIHz1eI5IxL4pZUp0+Q+DFCAfaOCNukXyqVH7r2tUVkQ8y3uliMiKEQ6HucGr0FlqGVlFN7j7k2poR8oB0bpepzvxMKpbr09OyDOkJLb4An4sdswwzsfkyL7dECKA==</encrypted>]]>&Identity;<![CDATA[<encrypted>%/vOP2em6Xhs7Z9GPyNAHjjBNhSB4n36RAHIrC3EsIUZOJpgG4hHoR/Q/8hBmCxWHSUmQylFesVOE3pC3Wxw6g6DMmVv1vBozKq0VnniMXHAQlO5NkMmzW4Blq17syK8lqKEVrosC7hOMH2nm8XIbGLDF0tPk94fmB0my8pW5Phdm7OgeBLKpCRVZNMEbvc2A0GnBa4TqTRcFhvL5+oacqMIa+VuBI+EHtVwf38yu5/ZGh6OxRMCZNBYirywQXFYPbnbPDGutXcEhqCPOhknF7jf28s76Y52dAeqRl/GFAnsQVS8FhzZpcFyzIzMe8K+UJbT/y6dZDTr7+i8gEZTSl/weX4RHRQcP+Pte0BCR/kd5b6frC5Q1STQGJogKoKbrB41LD3/qtHrtVzq+1iouug==</encrypted>]]>&Identity;<![CDATA[<encrypted>%tKdK3MWmxeikauzyRrII1gcpegwajj9A9mT3MP3P0Wepd+7xCDgl/33FGXBhvuCi</encrypted>]]>&OverrideScriptImport;<![CDATA[<encrypted>%IYfbRnGMZu+vvTXZ4br7KvBAJ2q6JwySSEjR6ZoMIUSPQ3iesukN1VsXuu6hSYa9P+ky90/4HO6CGv9PJl59EgL/FjG9SQVETqIYnNu+UeZ1L8z7jPSINbAPln82a4Z/Gbxp+rdDR4KBmCn1Yw9y1t9ktijDiDXTOOC9pitcS3CEjOg71949Xd/CXOT9XcqQBfEz70/H2OAaIWrDQE276qeiBAgGjQ1Uoq9FZEyHOqdyw9PF4hUZdGmoJl2odpku8tm1Vn/BLBV3viTdHaDhIAzgwpEciEfawK02rSPiIlzduGQogsERbEmjBZu1G/aVWi5Yq3op4nzEwPmytj+GEVZla90NdZv0rjqEuQ6fojsUUMR1DwwtbOQfiKt4PQ5S1hZlMn7wQW/YVI+mj5X/9eAmRxBOut2VugvxqdNi/8m+9RxwR6yPbwIM5DNexI6alL0fTcW9uItC0SKOFWpNIIS3pMfRA1YciLl87TcRSwDkTg7cFc0X7H9jk5DOBlonBaTKKmU76eJoWQnLy5tiiA==</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &UploadScript;
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70MgU3L9MV51GLhAC5KldzdIJNZ9RTQ5cy/QV/Zj/O55L</encrypted>]]>&Identity;<![CDATA[<encrypted>%rnZ922lNpfjaCeWsVZkA0WZiYw6XUQtQ2WPvtce3XMkAbvUh26+cM+Y6LHeeTBT66ltoDlSplfNkb+5A8FrLQlnK4FPFnqUpyAU4IeKFBysJuvmfDda46O8EczcRtmD0itwf8E9WbIHwLId2BMdi2Kma+eih+uabr+eiwrCYFxbWkMdoaxw/9UGUZWYMnrv6xgDS+7cETrnfSP7Gi9NyJD2rJKeWzSz1Zb8YnJDvugmwqkH9bvIhjA7je3lTJ/FKEnM28Kn4OyJDjcVfl6oM4w==</encrypted>]]>&Identity;<![CDATA[<encrypted>%rtKs3HO4ubXr6fq46WIrfMY+vxj5ddyyoutgGhLGg+wsbG4kDSfy9Br7CB81Z0C7Y8d+ocmYlcPxUdK5t6UahCErdMQpGylb9O/5okkAcaY9W5HHck54MnGXVjfbDE4ymhDUkl34azliBxi4OZbMgvLSdZ5wqBKouGmoCnhegmm2GWWTsOOWSJ3Tj9lduQjbaII2ftCq90T3jb2YF0Uazyxs2A0Q4JFMJfWe6LWDpd6r2KjoOWo51uoO1qkFe8PR</encrypted>]]>
    </text>
  </script>

  <response>
    <action id="GetTicket">
      <text>
        &UploadCreateTicket;<![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfz6e414K5THbJPKTpTCXK/0Soy/gsPLzbDunHmOYjOYz5znFkiGNhRte4WM40R4ZHA==</encrypted>]]>
      </text>
    </action>
  </response>

  &UploadButtonCss;
</dir>