import 'dart:convert';
import 'dart:js_interop';

import 'package:web/web.dart' as web;

void main() {
  makeRequest();
}

Future<void> makeRequest() async {
  const path = 'examples.json';
  final httpRequest = web.XMLHttpRequest();
  httpRequest.open('GET', path);
  httpRequest.onloadend =
      ((web.ProgressEvent e) => requestComplete(httpRequest)).toJS;
  httpRequest.send();
}

void requestComplete(web.XMLHttpRequest request) {
  final examples =
      web.document.querySelector('#examples') as web.HTMLDivElement;
  switch (request.status) {
    case 200:
      for (var obj in json.decode(request.responseText)) {
        final link = web.document.createElement('a') as web.HTMLAnchorElement;
        link.href = '${obj['folder']}/index.html';
        link.text = obj['title'];
        link.className = 'list-group-item list-group-item-action';
        examples.appendChild(link);
      }
      removeSpinner();
      return;
    default:
      final error = web.document.createElement('div') as web.HTMLDivElement;
      error.text = 'Request failed, status=${request.status}';
      error.className = 'alert alert-danger';
      examples.appendChild(error);
      removeSpinner();
  }
}

void removeSpinner() {
  final spinner = web.document.querySelector('#spinner') as web.HTMLDivElement;
  spinner.remove();
}
